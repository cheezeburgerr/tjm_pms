
import KanbanBoard from '@/Components/KanbanBoard/KanbanBoard';
import PrimaryButton from '@/Components/PrimaryButton';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import EmployeeLayout from '@/Layouts/EmployeeLayout';
import { Head, usePage } from '@inertiajs/react';
import { Card, Progress } from 'flowbite-react';
import PrintQueue from '@/Components/PrintQueue';
import PrintTable from '@/Components/PrintTable';


export default function Printers({ auth, boxes, order, printers }) {


    return (
        <EmployeeLayout

            user={auth.employee}
            header={<h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Printers</h2>}
        >

            <Head title="Printers" />


            <h1 className='text-2xl font-bold mb-8 '>Printers</h1>
            <div className="dark:text-gray-100">
                <div className="space-y-4">
                    <div className="grid grid-cols-6">
                        <p>Equipment</p>
                        <p>Type</p>
                        <p>Status</p>
                        <p>Running Time</p>
                        <p>Planned Production Time</p>
                        <p>Downtime</p>
                    </div>
                {printers.map(printer => (
                    <>
                        <Card className='dark:bg-zinc-900 dark:border-zinc-800 shadow-none'>
                        <div className="grid grid-cols-6">
                        <p>{printer.equipment_name}</p>
                        <p>{printer.type}</p>
                        <p>{printer.status}</p>
                        </div>
                        </Card>
                    </>
                ))}
                </div>
            </div>








        </EmployeeLayout>
    );
}
