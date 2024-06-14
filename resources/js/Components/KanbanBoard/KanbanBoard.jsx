import { Link } from '@inertiajs/react';
import { IconEye } from '@tabler/icons-react';
import React from 'react';

// Define KanbanCard component to represent each order
const KanbanCard = ({ order }) => {
    // Determine the background color based on the order status
    const getStatusBgColor = (status) => {
        switch (status) {
            case 'Pending':
                return 'bg-yellow-300';
            case 'Designing':
                return 'bg-blue-300';
            case 'Printing':
                return 'bg-purple-300';
            case 'Finished':
                return 'bg-green-300';
            default:
                return 'bg-gray-300'; // Default color for unknown status
        }
    };

    return (
        <div className={`text-gray-900 flex flex-col justify-between p-4 mb-4 rounded-lg shadow md:h-32 ${getStatusBgColor(order.production.status)}`}>
            <div className='flex justify-between'>
                <div>
                    <p className='font-bold'>{order.team_name}</p>
                    <p className='text-sm'>{order.due_date}</p>
                    <p className='text-sm'>{order.products_count} Products</p>
                </div>
                <div>
                    <Link href={route('employee.vieworder', order.id)}>
                        <IconEye />
                    </Link>
                </div>
            </div>
            <div>
                <p className='text-sm font-bold'>{order.production.status}</p>
            </div>

        </div>
    );
}



// Define KanbanBoard component
const KanbanBoard = ({ orders }) => {
    // Sort orders into corresponding status columns
    const columns = {
        'Designing': orders.filter(order => order.production.status === 'Designing'),
        'Printing': orders.filter(order => order.production.status === 'Printing'),
        'Sewing': orders.filter(order => order.production.status === 'Sewing'),
        'Finished': orders.filter(order => order.production.status === 'Finished'),
    };

    return (
        <div className="grid grid-cols-4 gap-4">
            {/* Render Kanban columns */}
            {Object.keys(columns).map(status => (
                <div key={status} className='m-2'>
                    <div className="flex justify-between">
                        <h3 className="text-lg font-semibold mb-4">{status}</h3>
                        {columns[status].length > 0 && <p className="opacity-50">{columns[status].length} Orders</p>}
                    </div>                {/* Render Kanban cards for orders in the current status */}
                    {columns[status].length > 0 ? (
                        columns[status].map(order => (
                            <KanbanCard key={order.id} order={order} />
                        ))
                    ) : (
                        <p className='text-center text-gray-500'>No orders</p>
                    )}
                </div>
            ))}
        </div>
    );
};

export default KanbanBoard;
