<?php

namespace App\Http\Controllers;

use App\Models\Lineup;
use App\Models\Order;
use App\Models\OrderProduct;
use App\Models\OrderVariation;
use App\Models\Products;
use Illuminate\Http\Request;
use Inertia\Inertia;

class OrderProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $product = OrderProduct::with('variations.category', 'variations.variations')->findOrFail($id);
        $prod = Products::with('categories.variation')
            ->where('id', $product->product_id)
            ->first();
        // dd($product, $prod);
        return Inertia::render('Order/SelectedProducts/Edit', [
            'selectedProduct' => $product,
            'product' => $prod,
        ]);
    }

    public function update(Request $request, $id)
    {
        $order = OrderProduct::findOrFail($id);
        $total_price = 0;
        foreach ($request->input('selectedProduct.variations') as $variation) {
            $orderVariation = OrderVariation::updateOrCreate(
                [
                    'product_id' => $order->id,
                    'category_id' => $variation['category_id'],
                ],
                [
                    'variation_id' => $variation['variation_id'],
                ],
            );
        }

        $lineup = Lineup::where('order_id', $orderVariation->order_id)->get();

        foreach ($lineup as $lineup) {
            if ($lineup->product_id === $order->product_id) {
                $subtotal = $request['subtotal'];
                if ($lineup->classification === 'Kid') {
                    $subtotal -= 50;
                }

                $lineup->price = $subtotal;
                $lineup->update();
            }

            $total_price += $lineup->price;
        }

        $order->subtotal = $request->subtotal;
        $order->update();

        $order = Order::find($orderVariation->order_id);
        $order->total_price = $total_price;

        $order->update();

        return redirect()
            ->route('orders.show', $orderVariation->order_id)
            ->with('success', 'Order variations updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
