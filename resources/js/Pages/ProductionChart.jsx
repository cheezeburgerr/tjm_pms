// resources/js/Pages/ProductCountChart.js
import React, { useState, useEffect } from 'react';

import { Doughnut, Line, Pie } from 'react-chartjs-2';
import 'chart.js/auto';
import { router } from '@inertiajs/react';
import EmployeeLayout from '@/Layouts/EmployeeLayout';
import LineChart from '@/Components/Charts/LineChart';
import { Card } from 'flowbite-react';
import DoughnutCharts from '@/Components/Charts/DoughnutCharts';

const ProductionChart = ({ auth }) => {
    const [chartData, setChartData] = useState(null);
    const [orderData, setOrderData] = useState(null);
    const [earningsData, setEarningsData] = useState(null);
    const [lineupsData, setLineupsData] = useState(null);
    const [variationsData, setVariationsData] = useState(null);

    const groupedData = {
        "Cut": [{ count: 10 }, { count: 20 }],
        "Neck Type": [{ count: 15 }, { count: 25 }, { count: 5 }, { count: 10 }],
        "Collar": [{ count: 30 }, { count: 40 }],
        "Button": [{ count: 20 }, { count: 10 }],
        "Short Type": [{ count: 10 }, { count: 15 }]
      };
    useEffect(() => {



        const fetchData = async () => {
            const response = await axios.get('/api/production');
            const data = response.data.variations;

            setChartData(response.data.products);
            setOrderData(response.data.sales);
            setEarningsData(response.data.earnings);
            setLineupsData(response.data.lineups);
            setVariationsData(response.data.variations);
            console.log(response.data.variations)


        };

        fetchData();







    }, []);

    return (
        <EmployeeLayout user={auth.employee}>
            <h1 className="font-bold text-2xl mb-4">
                Sales
            </h1>


            <>
                <div className='space-y-4'>

                    <div className="space-y-4 md:space-y-0 transition-all md:flex gap-4 items-start">


                        <div className="md:w-2/5 flex flex-col gap-4">
                        <div className=" h-full grid grid-cols-2 grid-rows-2 gap-4">
                            <div className=" bg-gray-50 dark:bg-zinc-900 rounded-lg p-4">
                                <h1 className="font-bold">Orders</h1>
                                {orderData && (
                                    <>
                                        <p className="text-3xl font-bold">{orderData}</p>
                                    </>
                                )}
                            </div>
                            <div className="bg-gray-50 dark:bg-zinc-900 rounded-lg p-4">
                                <h1 className="font-bold">Earnings</h1>
                                {earningsData && (
                                    <>
                                        <p className="text-3xl font-bold">{earningsData}</p>
                                    </>
                                )}
                            </div><div className="bg-gray-50 dark:bg-zinc-900 rounded-lg p-4">
                                <h1 className="font-bold">Lineups</h1>
                                {lineupsData && (
                                    <>
                                        <p className="text-3xl font-bold">{lineupsData}</p>
                                    </>
                                )}
                            </div><div className="bg-gray-50 dark:bg-zinc-900 rounded-lg p-4">
                                <h1 className="font-bold">Orders</h1>
                                {orderData && (
                                    <>
                                        <p className="text-3xl font-bold">{orderData}</p>
                                    </>
                                )}
                            </div>
                        </div>
                        <Card className="dark:border-zinc-800 shadow-none dark:bg-zinc-900 rounded-lg">
                            <p className="font-bold">Top Products</p>
                            {chartData && (
                                <>
                                    <table className='table-auto w-full text-center'>
                                        <thead>
                                            <th></th>
                                            <th className='py-2'>Name</th>
                                            <th>Number of Orders</th>
                                        </thead>
                                        <tbody>
                                            {chartData.map(product => (
                                                <>
                                                    <tr className='border-t border-1 border-gray-500'>
                                                        <td className='py-1'><img src={product.image ? `/images/products/${product.image}` : '/images/placeholder.png'} alt="" className='rounded-md h-10' /></td>
                                                        <td>{product.products.product_name}</td>
                                                        <td>{product.count}</td>
                                                    </tr>
                                                </>
                                            ))}
                                        </tbody>
                                    </table>
                                </>
                            )}</Card></div>

                        <div className="md:w-3/5">
                        <LineChart url={'/api/orders-per-month'} label={'Orders Per month'} title={'Orders'} /></div>



                    </div>
                    <div className=''>
                    {variationsData && (
                        <DoughnutCharts groupedData={variationsData} title={'Selected Variations in Products'} />
                    )}
                    </div>


                </div>
            </>

        </EmployeeLayout>
    );
};

export default ProductionChart;
