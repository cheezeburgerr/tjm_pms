import PrimaryButton from '@/Components/PrimaryButton';
import Table from '@/Components/Table';
import EmployeeLayout from '@/Layouts/EmployeeLayout';
import { Head, Link, usePage, useForm } from '@inertiajs/react';
import { IconCheck, IconEye } from '@tabler/icons-react';
import { Select, Toast, Tooltip } from 'flowbite-react';
import moment from 'moment';
import { useMemo, useEffect, useState } from 'react';
import { getStatusColor } from '@/statusColors'; // Import the getStatusColor function

export default function FinalChecking({ auth, order, artists }) {
    const { data, setData, post, processing, errors } = useForm({
        artist: '',
        role: 'Artist'
    });

    const { props } = usePage();
    const [selectedOrderId, setSelectedOrderId] = useState(null);

    const handleChange = (e, id) => {
        const selectedArtist = e.target.value;
        setSelectedOrderId(id); // Set the selected order ID
        setData('artist', selectedArtist); // Update the form data
    };

    useEffect(() => {
        if (data.artist && selectedOrderId) {
            post(route('employee.assign-artist', selectedOrderId));
        }
    }, [data.artist, selectedOrderId]);

    console.log(data);

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

        ],
        []
    );

    return (
        <EmployeeLayout
            user={auth.employee}
            header={<h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Checking</h2>}
        >
            {props.flash.success && (
                <div className="fixed bottom-10 left-10 z-50">
                    <Toast>
                        <span>{props.flash.success}</span>
                        <Toast.Toggle />
                    </Toast>
                </div>
            )}
            <Head title="Final Checking" />
            <h1 className='text-2xl font-bold mb-8'>Final Checking</h1>
            <div className="dark:text-gray-100">
                {/* Render KanbanBoard with orders */}
                <Table data={order} columns={columns} />
            </div>
        </EmployeeLayout>
    );
}
