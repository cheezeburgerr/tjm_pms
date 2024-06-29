<?php

namespace App\Http\Controllers;

use App\Jobs\SendNotif;
use App\Models\ApproveDesign;
use App\Models\Lineup;
use App\Models\Notification;
use App\Models\Order;
use App\Models\OrderProduct;
use App\Models\OrderVariation;
use App\Models\ProductionDetails;
use App\Models\Products;
use App\Models\User;
use Carbon\Carbon;
use Dompdf\Dompdf;
use Dompdf\Options;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;
use Inertia\Inertia;

class OrderController extends Controller
{
    //

    public function index () {

        $products = Products::with('categories.variation')->get();
        return Inertia::render('Order', ['products' => $products]);
    }


    public function summary ($id) {
        $order = Order::with('products.products', 'products.variations.category', 'products.variations.variations', 'lineups.products', 'files')->find($id);
        // dd($order);
        if($order->downpayment == null) {
            return Inertia::render('Order/OrderDownpayment', ['order' => $order]);
        }

        return redirect()->route('orders.show', $order->id);
    }

    public function downpayment_store (Request $request, $id) {
        $order = Order::find($id);


        if ($request->has('image')) {
            $imagePath = $request->file('image');
            $name = time() . '.' . $imagePath->getClientOriginalExtension();
            $imagePath->move('images/customers/downpayment', $name);
        }

        $order->downpayment = $name;
        $order->save();

        return to_route('dashboard', ['id' => $id]);
    }

    public function show ($id) {

        $order = Order::with('production', 'products.products', 'products.variations.category', 'products.variations.variations', 'lineups.products', 'files', 'customer', 'latestapproved')->find($id);
        if(!$order){
            return redirect()->route('dashboard');
        }

        if(Auth::user()->id !== $order->customer->id){
            return redirect()->route('dashboard');
        }
        return Inertia::render('Order/OrderDetails', ['order' => $order]);
    }
    public function store(Request $request)
    {
        // $validatedData = $request->validate([
        //     'team_name' => 'required|string|max:255',
        //     'due_date' => 'required|date',
        //     'products' => 'required|array',
        //     'products.*.id' => 'required|exists:products,id',
        //     'products.*.variations' => 'array',
        //     'lineups' => 'required|array',
        //     'lineups.*.player_name' => 'required|string|max:255',
        //     'lineups.*.product' => 'required|exists:products,id',
        //     'lineups.*.classification' => 'required|string',
        //     'lineups.*.gender' => 'required|string',
        //     'lineups.*.upper_size' => 'required|string',
        //     'lineups.*.lower_size' => 'required|string',
        //     // add other lineup fields validations as required
        // ]);

        // dd($request);

        $total_price = 0;

        $order = Order::create([
            'team_name' => $request['team_name'],
            'due_date' => $request['due_date'],
            'customer_id' => auth()->user()->id
        ]);

        ProductionDetails::create([
            'order_id' => $order->id,
        ]);

        if ($request->hasFile('files')) {
            foreach ($request->file('files') as $file) {
                $path = $file->store('images/orders', 'public');
                $path = $file->move('images/orders', $file->getClientOriginalName());

                $order->files()->create([
                    'order_id' => $order->id,
                    'path' => $path,
                    'file_name' => $file->getClientOriginalName(),
                ]);
            }
        }

        foreach ($request['products'] as $product) {
            $orderProduct = OrderProduct::create([
                'order_id' => $order->id,
                'product_id' => $product['id'],
                'subtotal' => $product['subtotal'],
            ]);

            // Process variations for this product
            foreach ($request['variations'] as $categoryId => $variationId) {

                $p = Products::with('categories')->find($product['id']);

                foreach($p->categories as $cat){
                    if($cat->id == $categoryId){
                        OrderVariation::create([
                            'order_id' => $order->id,
                            'product_id' => $orderProduct->id,
                            'variation_id' => $variationId,
                            'category_id' => $categoryId,
                        ]);
                    }
                }

            }

            foreach ($request['lineups'] as $lineup) {
                if($lineup['product'] == $product['id']){

                    $subtotal = $orderProduct->subtotal;
                    if($lineup['classification'] == 'Kid'){
                        $subtotal -= 50;
                    }
                    Lineup::create([
                        'order_id' => $order->id,
                        'product_id' => $lineup['product'],
                        'player_name' => $lineup['player_name'],
                        'player_details' => $lineup['player_details'] ?? '',
                        'classification' => $lineup['classification'],
                        'gender' => $lineup['gender'],
                        'upper_size' => $lineup['upper_size'] ?? '',
                        'lower_size' => $lineup['lower_size'] ?? '',
                        'price' => $subtotal,
                        'remarks' => $lineup['remarks'] ?? '',
                    ]);

                    $total_price += $subtotal;
                }
            }

            $order->total_price = $total_price;
            $order->update();
        }

        // foreach ($request['lineups'] as $lineup) {


        //     Lineup::create([
        //         'order_id' => $order->id,
        //         'product_id' => $lineup['product'],
        //         'player_name' => $lineup['player_name'],
        //         'player_details' => $lineup['player_details'] ?? '',
        //         'classification' => $lineup['classification'],
        //         'gender' => $lineup['gender'],
        //         'upper_size' => $lineup['upper_size'] ?? '',
        //         'lower_size' => $lineup['lower_size'] ?? '',
        //         'remarks' => $lineup['remarks'] ?? '',
        //     ]);
        // }


        // }

        $csr = User::where('dept_id', 2)->get();
        foreach($csr as $c){
            $notif = Notification::create([
                'user_id' => $c->id,
                'title' => 'New Order Placed',
                'message' => 'Order "'.$order->team_name.'" has been placed by one of the customers. Check it out.',
                'url' => '/employee/view-order/'.$order->id
            ]);

            SendNotif::dispatch($notif);
        }


        dd('Tapos');
        return redirect()->route('orders.downpayment', $order->id); // Adjust as per your needs
    }

    public function cancel_order(Request $request, $id) {


        $order = Order::with('production')->find($id);
        $order->production->status = $request->status;
        $order->production->save();


        return to_route('dashboard')->with('success', 'Order Successfully Cancelled.');
    }

    public function approval ($id) {
        $order = Order::with('production', 'latestapproved')->find($id);

        return Inertia::render('Approval', ['order' => $order]);
    }

    public function approve (Request $request) {
        $approved = ApproveDesign::find($request->id);
        $approved->status = 'Approved';
        $approved->save();

        $order = Order::with('production')->find($approved->order_id);
        $order->production->note = 'Design Approved';
        $order->production->save();

        return to_route('dashboard')->with('success', 'Design Approved');
    }

    public function reject (Request $request) {
        $approved = ApproveDesign::find($request->id);
        $approved->status = 'Rejected';
        $approved->save();

        $order = Order::with('production')->find($approved->order_id);
        $order->production->note = 'Design Rejected';
        $order->production->save();

        return to_route('dashboard')->with('success', 'Design Rejected');
    }


    public function exportPdf(Request $request)
    {

        $orders = Order::query();



        // dd($request->startDate);
        if ($request->filterStatus !== null) {
            $orders->whereHas('production', function ($query) use ($request) {
                $query->where('status', $request->filterStatus);
            });
        }

        if ($request->startDate !== null && $request->endDate !== null) {
            $startDate = Carbon::parse($request->startDate)->startOfDay();
            $endDate = Carbon::parse($request->endDate)->endOfDay();
            $orders->whereBetween('created_at', [$startDate, $endDate]);
        }

        // if ($request->has('showUserOrders') && $request->showUserOrders) {
        //     $orders->whereHas('employees', function ($query) use ($request) {
        //         $query->where('user_id', $request->auth_employee_id);
        //     });
        // }

        $orders = $orders->get();

        // dd($orders);



        $pdfOptions = new Options();
        $pdfOptions->set('isHtml5ParserEnabled', true);
        $pdfOptions->set('isRemoteEnabled', true);

        $dompdf = new Dompdf($pdfOptions);
        $dompdf->loadHtml(View::make('orders.pdf', ['orders' => $orders])->render());
        $dompdf->setPaper('A4', 'portrait');
        $dompdf->render();

        return $dompdf->stream('orders.pdf');
    }

    public function return ($id)
    {
        $order = Order::with('lineups.products', 'production')->find($id);

        // dd($order);
        return Inertia::render('Return', ['order' => $order]);
    }

    public function return_records(Request $request)
    {

        $requestData = $request->input('records');

        foreach ($requestData as $recordData) {

            $record = Lineup::find($recordData['id']);

            if ($record) {
                $record->status = 'Error';
                $record->note = $recordData['errorType'];
                $record->save();
            }
        }


        return to_route('dashboard');
    }
}
