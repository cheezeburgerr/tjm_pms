<!DOCTYPE html>
<html>
<head>
    <title>Orders Report</title>
    <style>
        table {
            font-family: 'Tahoma';
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            font-family: 'Tahoma';
            border: 1px solid black;
        }
        th, td {
            font-family: 'Tahoma';
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h1>Orders Report</h1>
    <table>
        <thead>
            <tr>
                <th>Team Name</th>
                <th>Due Date</th>
                <th>Status</th>
                <th>Products</th>
                <th>Date Ordered</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($orders as $order)
            <tr>
                <td>{{ $order->team_name }}</td>
                <td>{{ \Carbon\Carbon::parse($order->due_date)->format('F j, Y') }}</td>
                <td>{{ $order->production->status }}</td>
                <td>@foreach ($order->products as $product)
                    @foreach ($product->products as $p)
                    <p>{{ $p->product_name }}</p>
                    @endforeach

                @endforeach</td>
                <td>{{ \Carbon\Carbon::parse($order->date_created)->format('F j, Y') }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
