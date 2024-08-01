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
        .header {
            text-align: center;
            border-bottom: 1px solid black;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1 class="font-semibold text-center ">Orders Report</h1>
        <img src="images/TJM_logo.png" alt="">
    </div>
    <table>
        <thead>
            <tr>
                <th>Team Name</th>
                <th>Due Date</th>
                <th>Status</th>
                <th>Products</th>
                <th>Total Lineups</th>
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
                <td>{{ $order->lineups_count }}</td>
                <td>{{ \Carbon\Carbon::parse($order->date_created)->format('F j, Y') }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
