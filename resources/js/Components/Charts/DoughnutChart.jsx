// resources/js/Pages/ProductCountChart.js
import React, { useState, useEffect } from 'react';

import { Doughnut, Line, Pie } from 'react-chartjs-2';
import 'chart.js/auto';
import { router } from '@inertiajs/react';
import EmployeeLayout from '@/Layouts/EmployeeLayout';
import { Card, Spinner } from 'flowbite-react';

const DoughnutChart = ({ data2, label, title }) => {

    const [data, setdata] = useState(data2);


    useEffect(() => {



        const fetch = async () => {
            // const response = await axios.get(url);
            // const data = response.data.data;

            const formattedData = {
                labels: data.map(item => item.label),
                datasets: [
                    {
                        label: label,
                        data: data.map(item => item.count),
                        backgroundColor: [
                            'rgba(0, 255, 255, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(199, 199, 199, 0.2)',
                            'rgba(83, 102, 255, 0.2)',
                            'rgba(123, 122, 23, 0.2)',
                            'rgba(231, 100, 200, 0.2)',
                            'rgba(200, 89, 50, 0.2)',
                            'rgba(66, 245, 66, 0.2)',
                        ],
                        borderColor: [
                            'rgba(0, 255, 255, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)',
                            'rgba(199, 199, 199, 1)',
                            'rgba(83, 102, 255, 1)',
                            'rgba(123, 122, 23, 1)',
                            'rgba(231, 100, 200, 1)',
                            'rgba(200, 89, 50, 1)',
                            'rgba(66, 245, 66, 1)',
                        ],
                        borderWidth: 3,
                    },
                ],
            };

            setdata(formattedData);
        };

        fetch();
    }, []);

    return (


        <>
            <Card className="dark:border-zinc-800 shadow-none w-full h-full dark:bg-zinc-900 rounded-lg">
                {data ? (

                    <>
                        <p className="font-bold">{title}</p>

                        <DoughnutChart data={data} />
                    </>


                ) : (
                    <div className='w-full h-full text-center'>
                        <Spinner/>
                    </div>
                )}
            </Card>
        </>


    );
};

export default DoughnutChart;
