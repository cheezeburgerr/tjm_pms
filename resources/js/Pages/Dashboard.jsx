import PrimaryButton from '@/Components/PrimaryButton';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head } from '@inertiajs/react';
import { IconArrowDown } from '@tabler/icons-react';

export default function Dashboard({ auth }) {
    return (
        <AuthenticatedLayout
            user={auth.user}
            header={<h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Dashboard</h2>}
        >
            <Head title="TJM Sportswear" />

            <div className='p-4 h-60 lg:h-48 py-12 dark:text-gray-100 text-center'>
                <h1 className='text-5xl md:text-6xl lg:text-8xl tracking-tight font-black uppercase '>Sweat it with Style</h1>
                <p className='text-xl mt-4'>This is TJM Sportswear. Your number one sportswear apparel buddy</p>
                <PrimaryButton className='mt-4'>Order Now</PrimaryButton>
            </div>
            <div className="py-12">
                <div className=" max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div className="">
                    <img src="images\longsleeve.png" alt="" />

                </div>
                <div className="hidden md:block animate-bounce sticky bottom-10 text-center ">

                    <div className="flex justify-center">
                    <div className="bg-zinc-900 text-gray-200 dark:bg-gray-100 dark:text-gray-900 rounded-full p-3"><IconArrowDown /></div>
                    </div>
                </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
