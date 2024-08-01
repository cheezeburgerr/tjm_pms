
import PrimaryButton from '@/Components/PrimaryButton';
import Table from '@/Components/Table';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import AdminLayout from '@/Layouts/AdminLayout';
import { Head, usePage, Link } from '@inertiajs/react';
import { Alert, Progress } from 'flowbite-react';
import { useState, useEffect } from 'react';
import { Button, Tooltip, Badge } from 'flowbite-react';
import { IconRefresh, IconEye, IconPrinter, IconCheck, IconInfoCircle } from '@tabler/icons-react';
import Checkbox from '@/Components/Checkbox';
import moment from 'moment';
import Modal from '@/Components/Modal';
import PrintModal from '@/Components/PrintModal';


export default function Dashboard({ auth, boxes, orders, printers }) {

    const componentToRender = <KanbanBoard orders={orders} printers={printers} user={auth.admin} />

    return (
        <AdminLayout

            user={auth.admin}
            header={<h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Dashboard</h2>}
        >

<Head title="Dashboard" />


<h1 className='text-2xl font-bold mb-2 '>Hello {auth.admin.name}!</h1>
<div className="dark:text-gray-100 relative">

{componentToRender}
 </div>



        </AdminLayout>
    );
}


const KanbanCard = ({ order, user }) => {
    const [isHovered, setIsHovered] = useState(false);
    const [showPrintModal, setShowPrintModal] = useState(false);

    const getStatusBgColor = (status) => {
        switch (status) {
            case 'Pending':
                return 'bg-yellow-500';
            case 'Designing':
                return 'bg-blue-500';
            case 'Printing':
                return 'bg-purple-500';
            case 'Sewing':
                return 'bg-teal-500';
            case 'Finished':
                return 'bg-green-500';
            default:
                return 'bg-gray-500'; // Default color for unknown status
        }
    };

    const handlePrintSubmit = () => {

        setShowPrintModal(false);
    };

    const closeModal = () => {
        setShowPrintModal(false);
    };

    return (
        <div
            className={`text-gray-100 relative flex flex-col justify-between  my-6 rounded-lg shadow transition ${getStatusBgColor(order.production.status)} `}
            onMouseEnter={() => setIsHovered(true)}
            onMouseLeave={() => setIsHovered(false)}

        >
            <div className="p-5">
                <div className='flex justify-between'>
                    <div>
                        <p className='font-bold'>{order.team_name}</p>
                        <p className='text-sm'>{moment(order.due_date).format('MMMM Do YYYY')}</p>
                        <p className='text-sm'>{order.products_count} Products</p>
                    </div>
                    <div className='flex gap-2 '>
                        {order.errors_count != 0 && (
                            <>
                                <Badge color={'warning'}>
                                    {order.errors_count} Errors
                                </Badge>
                            </>
                        )}
                        <Link href={route('admin.vieworder', order.id)}>
                            <Tooltip content='View'>
                                <IconEye />
                            </Tooltip>
                        </Link>
                    </div>
                </div>
                <div>
                    <p className='text-sm font-bold'>{order.production.status} {order.production.note && (<>| {order.production.note}</>)}</p>


                </div>
                {isHovered && (
                    <div className={`absolute right-4 -bottom-4 p-2 bg-zinc-900 dark:bg-zinc-100 rounded-full transition flex gap-3 z-10 `}>

                        <Link href={route('admin.production', order.id)} className="text-gray-500 hover:text-gray-100 dark:hover:text-gray-800 ">
                            <Tooltip content='Production Details' placement='bottom'>
                                <IconInfoCircle />
                            </Tooltip>
                        </Link>

                    </div>
                )}

            </div>
            {order.production.status === 'Printing' && (
                <>
                    <div className="relative w-full overflow-hidden">
                        <p className="absolute inset-0 font-bold ml-5 text-xs text-gray-900 ">{order.production.printing_progress.toFixed(2)}% Complete</p>
                        <div className=" w-full overflow-hidden h-5 text-xs flex rounded-b-md bg-gray-400">
                            <div
                                style={{ width: `${order.production.printing_progress}%` }}
                                className="shadow-none flex flex-col text-center whitespace-nowrap text-white justify-center bg-gray-100 transition-all duration-500"
                            ></div>
                        </div>

                    </div>
                </>
            )}
            {order.production.status === 'Sewing' && (
                <>
                    <div className="relative w-full overflow-hidden">
                        <p className="absolute inset-0 font-bold ml-5 text-xs text-gray-900 ">{order.production.sewing_progress.toFixed(2)}% Complete</p>
                        <div className=" w-full overflow-hidden h-5 text-xs flex rounded-b-md bg-gray-400">
                            <div
                                style={{ width: `${order.production.sewing_progress}%` }}
                                className="shadow-none flex flex-col text-center whitespace-nowrap text-white justify-center bg-gray-100 transition-all duration-500"
                            ></div>
                        </div>

                    </div>
                </>
            )}
        </div>
    );
};

// Define KanbanBoard component
const KanbanBoard = ({ orders, user }) => {


    const webSocketChannel = `notifications_channel`;



    const [order, setOrder] = useState(orders);
    const [showUserOrders, setShowUserOrders] = useState(false);

    // Filter orders based on the toggle switch
    const filteredOrders = showUserOrders
        ? order.filter(order => order.employees.some(e => e.user_id === user.id))
        : order;


    const connectWebSocket = () => {
        window.Echo.channel(webSocketChannel)
            .listen('GotNotif', async (e) => {
                // e.message
                await fetchOrders();
            });
    }

    const fetchOrders = async () => {
        try {
            const response = await axios.get(`/api/get-orders`);
            setOrder(response.data);
        } catch (error) {
            console.error('Error fetching printers:', error);
        }
    };

    useEffect(() => {
        connectWebSocket();
        fetchOrders();
    }, []);

    // Sort orders into corresponding status columns
    const columns = {
        'Designing': filteredOrders.filter(order => order.production.status === 'Designing'),
        'Printing': filteredOrders.filter(order => order.production.status === 'Printing'),

        'Sewing': filteredOrders.filter(order => order.production.status === 'Sewing'),
        'Done': filteredOrders.filter(order => ['Finished', 'Released'].includes(order.production.status)),
    };

    return (
        <div className="md:h-[calc(100vh-148px)] flex flex-col">
            <div className="flex justify-end items-center mb-4">
                <Button color={'transparent'} onClick={fetchOrders}><IconRefresh/></Button>
                <label className="flex items-center">
                    <Checkbox
                        type="checkbox"
                        className="mr-2"
                        checked={showUserOrders}
                        onChange={() => setShowUserOrders(!showUserOrders)}
                    />
                    Your Teams
                </label>
            </div>
            <div className="flex-grow grid md:grid-cols-2 lg:grid-cols-4 gap-3 overflow-hidden ">
                {/* Render Kanban columns */}
                {Object.keys(columns).map(status => (
                    <div key={status} className="flex flex-col relative overflow-hidden max-h-80 md:max-h-screen  bg-gray-50 dark:bg-zinc-900 p-4 rounded-lg border border-zinc-200 dark:border-zinc-800">
                        <div className="flex justify-between">
                            <h3 className="text-lg font-semibold mb-4">{status}</h3>
                            {columns[status].length > 0 && <p className="opacity-50">{columns[status].length} Orders</p>}
                        </div>
                        <div className="flex-grow overflow-y-auto no-scrollbar rounded-md ">
                            {/* Render Kanban cards for orders in the current status */}
                            {columns[status].length > 0 ? (
                                columns[status].map(order => (
                                    <KanbanCard key={order.id} order={order} user={user} />
                                ))
                            ) : (
                                <p className="text-center text-gray-500">No orders</p>
                            )}
                        </div>
                    </div>
                ))}
            </div>
        </div>
    );
};
