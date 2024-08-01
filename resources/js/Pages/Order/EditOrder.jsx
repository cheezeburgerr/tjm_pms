import React, { useState, useRef } from 'react';
import { Head, useForm } from '@inertiajs/react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import PrimaryButton from '@/Components/PrimaryButton';
import { Card, Label } from 'flowbite-react';
import TextInput from '@/Components/TextInput';
import InputLabel from '@/Components/InputLabel';
import { IconUpload, IconX } from '@tabler/icons-react';

export default function EditOrder({ auth, product, order }) {

    const fileInputRef = useRef(null);
    const [uploadedFiles, setUploadedFiles] = useState([]);
    const [previousFiles, setPreviousFiles] = useState(order.files);

    const { data, setData, put, processing, errors } = useForm({
        team_name: order.team_name || '',
        due_date: order.due_date || '',
        newFiles: [],
        previousFiles: previousFiles || []
    });


    const handleFileChange = (e) => {
        const files = e.target.files;

        setData(prevData => ({
            ...prevData,
            newFiles: files
        }));

        const fileURLs = Array.from(files).map(file => URL.createObjectURL(file));
        setUploadedFiles(prevFiles => [...prevFiles, ...fileURLs]);
    };

    const handleUploadButtonClick = () => {
        fileInputRef.current.click();
    };

    const handleRemoveFile = (index) => {
        const updatedFiles = [...uploadedFiles];
        updatedFiles.splice(index, 1);
        setUploadedFiles(updatedFiles);
    };

    const handleRemovePreviousFile = (index) => {
        const updatedFiles = [...previousFiles];
        updatedFiles.splice(index, 1);
        setPreviousFiles(updatedFiles);
        setData('previousFiles', updatedFiles);
        console.log(previousFiles);
    };

    const handleChange = (e) => {
        const { name, value } = e.target;
        setData(name, value);
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        put(route('orders.update', order.id));
    };

    return (
        <AuthenticatedLayout
            user={auth.user}
            header={<h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Edit Order</h2>}
        >
            <Head title="Edit Order" />

            <div className="py-12">
                <div className="max-w-7xl mx-auto sm:px-6 lg:px-8 dark:text-gray-200 md:w-1/2 2xl:w-1/3">
                    <h1 className='font-bold mb-6 text-xl'>Edit Order</h1>
                    <Card className='dark:bg-zinc-900'>
                        <form onSubmit={handleSubmit} enctype="multipart/form-data">
                            <div className="mb-4">
                                <Label htmlFor="team_name" value="Team Name" />
                                <TextInput
                                    id="team_name"
                                    name="team_name"
                                    value={data.team_name}
                                    onChange={handleChange}
                                    className="mt-1 block w-full"
                                />
                                {errors.team_name && <span className="text-red-600">{errors.team_name}</span>}
                            </div>
                            <div className="mb-4">
                                <Label htmlFor="due_date" value="Due Date" />
                                <TextInput
                                    type="date"
                                    id="due_date"
                                    name="due_date"
                                    value={data.due_date}
                                    onChange={handleChange}
                                    className="mt-1 block w-full"
                                />
                                {errors.due_date && <span className="text-red-600">{errors.due_date}</span>}
                            </div>
                            <InputLabel className="font-bold mb-3">Uploaded Designs</InputLabel>
                            <div className="w-full flex flex-wrap justify-start gap-4 mb-3">

                                {previousFiles.map((file, index) => (
                                    <div key={index} className="relative w-20 h-20 rounded-lg">
                                        <img src={`/images/orders/${file.file_name}`} alt={`Uploaded Image ${index + 1}`} className="object-cover w-full h-full rounded-lg" />
                                        <button
                                            type="button"
                                            onClick={() => handleRemovePreviousFile(index)}
                                            className="absolute -top-3 -right-3 p-1 bg-zinc-500 text-white rounded-full text-xs hover:bg-red-600 focus:outline-none"
                                        >
                                            <IconX size={16} />
                                        </button>
                                    </div>
                                ))}
                            </div>
                            <div className="mb-4 w-full">
                                <InputLabel htmlFor="files">Upload Design</InputLabel>
                                <input
                                    type="file"
                                    name="files"
                                    id="files"
                                    accept="image/*"
                                    multiple
                                    ref={fileInputRef}
                                    onChange={handleFileChange}
                                    className="hidden"
                                />
                                <div
                                    onClick={handleUploadButtonClick}
                                    className="block w-full border border-zinc-300 dark:border-zinc-800 rounded-md p-4 text-center cursor-pointer bg-zinc-50 shadow-lg dark:bg-zinc-900"
                                >
                                    <div className="text-center flex justify-center flex-col items-center gap-4 opacity-50 border border-zinc-600 p-8 rounded-md">
                                        <IconUpload size={56} />
                                        Upload your design here.
                                    </div>
                                </div>
                            </div>
                            <div className="w-full flex flex-wrap justify-start gap-4">
                                {uploadedFiles.map((fileURL, index) => (
                                    <div key={index} className="relative w-20 h-20 rounded-lg">
                                        <img src={fileURL} alt={`Uploaded Image ${index + 1}`} className="object-cover w-full h-full rounded-lg" />
                                        <button
                                            type="button"
                                            onClick={() => handleRemoveFile(index)}
                                            className="absolute -top-3 -right-3 p-1 bg-zinc-500 text-white rounded-full text-xs hover:bg-red-600 focus:outline-none"
                                        >
                                            <IconX size={16} />
                                        </button>
                                    </div>
                                ))}
                            </div>
                            <PrimaryButton className="mt-4" processing={processing}>Save</PrimaryButton>
                        </form>
                    </Card>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
