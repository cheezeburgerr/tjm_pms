import DangerButton from '@/Components/DangerButton';
import PrimaryButton from '@/Components/PrimaryButton';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { getStatusColor } from '@/statusColors';
import { Head, Link, useForm } from '@inertiajs/react';
import { IconArrowDown } from '@tabler/icons-react';
import { Card } from 'flowbite-react';
import moment from 'moment';

export default function Approval({ auth, order }) {
    const { data, setData, put } = useForm({
        id: order.latestapproved.id
    });

    const approveSubmit = (e) => {
        e.preventDefault();
        put(route('orders.approve'));
    };

    const rejectSubmit = (e) => {
        e.preventDefault();
        put(route('orders.reject'));
    };
    return (
        <AuthenticatedLayout
            user={auth.user}
            header={<h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Approval</h2>}
        >
            <Head title="Approval" />


            <div className="py-12">
                <div className=" max-w-7xl mx-auto sm:px-6 lg:px-8 dark:text-gray-100">
                    <h1 className="text-2xl font-bold mb-4">Design Approval</h1>
                    <Card className='dark:bg-zinc-900 dark:border-zinc-800'>
                        <div className='flex justify-between items-start'>
                        <div>
                                <h3 className='font-bold'>Order #{order.id} | <span className={`text-center ${getStatusColor(order.production.status)}`}>{order.production.status}</span></h3>
                                <p>{order.team_name}</p>
                                <p className='text-sm'>{moment(order.due_date).format("MMMM Do, YYYY")}</p>

                            </div>
                            <div className='flex gap-2'>
                                <form onSubmit={approveSubmit}>
                                <PrimaryButton type='submit'>Approve</PrimaryButton>
                                </form>
                                <form onSubmit={rejectSubmit}>
                                <DangerButton type='submit'>Reject</DangerButton>
                                </form>
                            </div>
                        </div>
                        <img src={`/images/orders/approvals/${order.latestapproved.image_name}`} alt={order.latestapproved.image_name}  className='h-1/2 rounded-lg'/>
                    </Card>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
