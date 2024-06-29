import PrimaryButton from '@/Components/PrimaryButton';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, Link, useForm } from '@inertiajs/react';
import { IconArrowDown, IconChevronDown } from '@tabler/icons-react';
import { usePage } from '@inertiajs/react';
import { Button, Card, Popover, Toast } from 'flowbite-react';
import Checkbox from '@/Components/Checkbox';
import { useEffect, useState } from 'react';
import SecondaryButton from '@/Components/SecondaryButton';
import moment from 'moment';
import { getStatusColor } from '@/statusColors';

export default function Return({ auth, order }) {


    const { data, setData, put } = useForm({
        records: []
    });

    const [checkedOptionsMap, setCheckedOptionsMap] = useState(() => {
        const initialCheckedOptionsMap = {};
        order.lineups.forEach(record => {
            initialCheckedOptionsMap[record.id] = {
                'Wrong Size': false,
                'Wrong Number/Detail': false,
                'Reprint': false,
                'Other Reason': false
            };
        });
        return initialCheckedOptionsMap;
    });


    useEffect(() => {
        const requestData = Object.keys(checkedOptionsMap).map(recordId => {
            const checkedOptionsList = Object.keys(checkedOptionsMap[recordId]).filter(option => checkedOptionsMap[recordId][option]);
            return {
                id: recordId,
                errorType: checkedOptionsList.join(', ')
            };
        });

        setData('records', requestData);
    }, [checkedOptionsMap, setData]);

    const handelReturns = (recordId, option) => {
        setCheckedOptionsMap(prevState => ({
            ...prevState,
            [recordId]: {
                ...prevState[recordId],
                [option]: !prevState[recordId][option]
            }
        }));

    };

    const handleSubmit = (e) => {
        e.preventDefault();



        put(route('employee.returnrecords'), data);
    };
    return (
        <AuthenticatedLayout
            user={auth.user}
            header={<h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Dashboard</h2>}
        >
            <Head title="Return Order" />


            <div className="py-12 dark:text-zinc-100">
                <div className="p-4 max-w-7xl mx-auto sm:px-6 lg:px-8">
                    <h1 className="font-bold text-2xl mb-4">Return Errors</h1>
                    <Card className='dark:bg-zinc-900 dark:border-zinc-800 shadow-none mb-4'>

                    <div className="flex gap-4 justify-between">
                            <div>
                                <h3 className='font-bold'>Order #{order.id} | <span className={`text-center ${getStatusColor(order.production.status)}`}>{order.production.status}</span></h3>
                                <p>{order.team_name}</p>
                                <p className='text-sm'>{moment(order.due_date).format("MMMM Do, YYYY")}</p>
                            </div>

                        </div>
                    </Card>
                    <div className="moverflow-x-scroll md:overflow-x-visible">
                    <form onSubmit={handleSubmit}>
                    <table className='table-auto w-full text-center '>
                        <thead>
                        <th className='sticky left-0 dark:bg-zinc-950 bg-gray-200'>Reason</th>
                            <th>Product</th>
                            <th>Name</th>
                            <th>Details</th>
                            <th>Classification</th>
                            <th>Gender</th>
                            <th>Upper Size</th>
                            <th>Lower Size</th>
                            <th>Remarks</th>

                        </thead>
                        <tbody className=''>
                            {order.lineups.map(lineup => (
                                <>
                                    <tr>
                                    <td className='sticky left-0 dark:bg-zinc-950 bg-gray-200 py-2'>
                                            <Popover placement={'right'} content={
                                                <>
                                                    <div className='object-start text-start p-2'>
                                                        {Object.keys(checkedOptionsMap[lineup.id]).map((option, optionIndex) => (
                                                            <p key={optionIndex} className='me-4'>
                                                                <Checkbox
                                                                    className='me-2'
                                                                    type="checkbox"
                                                                    checked={checkedOptionsMap[lineup.id][option]}
                                                                    onChange={() => handelReturns(lineup.id, option)}
                                                                />
                                                                {option}
                                                            </p>
                                                        ))}
                                                    </div>
                                                </>
                                            }>

                                                <Button className='w-full' color={'secondary'}>Select Reason <IconChevronDown size={18}/></Button>
                                            </Popover>


                                    </td>
                                        <td>{lineup.products.product_name}</td>
                                        <td>{lineup.player_name}</td>
                                        <td>{lineup.player_details}</td>
                                        <td>{lineup.classification}</td>
                                        <td>{lineup.gender}</td>
                                        <td>{lineup.upper_size}</td>
                                        <td>{lineup.lower_size}</td>
                                        <td>{lineup.remarks}</td>

                                    </tr>
                                </>
                            ))}
                        </tbody>
                    </table>
                    <PrimaryButton type="submit" className="btn btn-primary float-right mb-4">Update</PrimaryButton>
                    </form>
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
