
import KanbanBoard from '@/Components/KanbanBoard/KanbanBoard';
import PrimaryButton from '@/Components/PrimaryButton';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import EmployeeLayout from '@/Layouts/EmployeeLayout';
import { Head, usePage } from '@inertiajs/react';
import { Progress } from 'flowbite-react';


export default function Dashboard({ auth, boxes, orders, production }) {


    console.log(auth.employee)
    return (
        <EmployeeLayout

            user={auth.employee}
            header={<h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Dashboard</h2>}
        >

            <Head title="Dashboard" />


           <h1 className='text-2xl font-bold mb-8 '>Hello {auth.employee.name}!</h1>
           <div className="dark:text-gray-100">
                {/* Render KanbanBoard with orders */}
                <KanbanBoard orders={orders} />

            </div>








        </EmployeeLayout>
    );
}
