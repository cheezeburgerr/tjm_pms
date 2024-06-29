import PrimaryButton from '@/Components/PrimaryButton';
import Table from '@/Components/Table';
import EmployeeLayout from '@/Layouts/EmployeeLayout';
import { Head, Link, usePage, useForm } from '@inertiajs/react';
import { IconCheck, IconEye } from '@tabler/icons-react';
import { Toast, Tooltip } from 'flowbite-react';
import moment from 'moment';
import { useMemo } from 'react';
import { getStatusColor } from '@/statusColors'; // Import the getStatusColor function

export default function PendingTeams({ auth, boxes, order, production }) {
    const { data, setData, post, processing, errors } = useForm({
        status: 'Pending',
    });

    const { props } = usePage();
    function submit(e, id) {
        e.preventDefault();
        post(route('employee.approve', id));
    }


    const columns = useMemo(
        () => [
            {
                Header: "Team Name",
                accessor: "team_name",
            },
            {
                Header: "Due Date",
                accessor: 'due_date',
                Cell: ({ row }) => (
                    <>
                        <p>{moment(row.original.due_date).format("MMMM Do, YYYY")}</p>
                    </>
                )
            },
            {
                Header: "Status",
                accessor: "production.status",
                Cell: ({ row }) => (
                    <p className={getStatusColor(row.original.production.status)}>
                        {row.original.production.status}
                    </p>
                )
            },
            {
                Header: "Date Ordered",
                accessor: 'date_created',
                Cell: ({ row }) => (
                    <>
                        <p>{moment(row.original.date_created).format("MMMM Do, YYYY")}</p>
                    </>
                )
            },
            {
                Header: ' ',
                Cell: ({ row }) => (
                    <div className='flex gap-4 justify-center items-center'>
                        <Link href={route('employee.vieworder', row.original.id)}>
                            <Tooltip content="View">
                                <IconEye className='hover:text-aqua transition' />
                            </Tooltip>
                        </Link>
                        <form onSubmit={(e) => submit(e, row.original.id)}>
                            <Tooltip content="Approve">
                                <button type="submit" className='hover:text-aqua transition'>
                                    <IconCheck />
                                </button>
                            </Tooltip>
                        </form>
                    </div>
                ),
            },
        ],
        []
    );

    return (
        <EmployeeLayout
            user={auth.employee}
            header={<h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Dashboard</h2>}
        >

            {props.flash.success && (
                <>


                    <div className="fixed bottom-10 left-10 z-50">
                        <Toast>

                            <span>{props.flash.success}</span>
                            <Toast.Toggle />
                        </Toast>
                    </div>



                </>
            )}
            <Head title="Pending Teams" />
            <h1 className='text-2xl font-bold mb-8'>Pending Teams</h1>
            <div className="dark:text-gray-100">
                {/* Render KanbanBoard with orders */}
                <Table data={order} columns={columns} />
            </div>
        </EmployeeLayout>
    );
}
