import { useForm } from "@inertiajs/react";
import { IconSend, IconUpload, IconX } from "@tabler/icons-react";
import { Card } from "flowbite-react";
import PrimaryButton from "./PrimaryButton";
import { useRef, useState } from "react";


const SendDesign = ({ order, user }) => {

    const { data, setData, post, processing } = useForm({
        file: '',
        order_id: order.id
    });
    const fileInputRef = useRef(null);
    const [uploadedFile, setUploadedFile] = useState(null);

    const handleFileChange = (e) => {
        const file = e.target.files[0];
        setData('file', file);
        // Extract file URL and update the state
        const fileURL = URL.createObjectURL(file);
        setUploadedFile(fileURL);
    };

    const handleUploadButtonClick = () => {
        fileInputRef.current.click();
    };

    const handleRemoveFile = () => {
        setUploadedFile(null);
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        post(route('employee.approvedesign'));
    };

    return (
        <>
            <div className="space-y-4">
            <Card className='bg-aqua dark:bg-aqua dark:border-zinc-700 text-zinc-900 shadow-none'>
            <h1 className="font-bold mb-2">Production Status</h1>
            <div>
            <h1 className="font-bold text-2xl mb-2">{order.production.status} </h1>
            
            <p><span className="opacity-50">Products:</span> {order.products_count}</p>
            <p><span className="opacity-50">Lineup:</span> {order.lineups_count}</p>
            <p><span className="opacity-50">Lineup Errors:</span> {order.errors_count}</p>
            </div>
        </Card>
            {user.dept_id === 1 && (
                <>
                    <Card className='dark:bg-zinc-900 dark:border-zinc-800 shadow-none'>
                <h1 className="font-bold mb-2">Send Design</h1>
                <form onSubmit={handleSubmit}>
                    <div className="mb-4 w-full">
                        <input
                            type="file"
                            name="file"
                            id="file"
                            accept="image/*"
                            ref={fileInputRef}
                            onChange={handleFileChange}
                            className="hidden"
                        />
                        <div
                            onClick={handleUploadButtonClick}
                            className="block w-full border border-zinc-300 dark:border-zinc-900 rounded-md text-center cursor-pointer bg-zinc-50 dark:bg-zinc-900"
                        >
                            <div className="text-center flex justify-center flex-col items-center gap-4 opacity-50 border border-zinc-500 p-8 rounded-md">
                                <IconUpload size={56} />
                                Upload your design here.
                            </div>
                        </div>
                    </div>
                    <div className="w-full flex flex-wrap justify-start gap-4">
                        {uploadedFile && (
                            <div className="relative w-20 h-20 rounded-lg">
                                <img src={uploadedFile} alt="Uploaded Image" className="object-cover w-full h-full" />
                                <button
                                    type="button"
                                    onClick={handleRemoveFile}
                                    className="absolute -top-3 -right-3 p-1 bg-zinc-500 text-white rounded-full text-xs hover:bg-red-600 focus:outline-none"
                                >
                                    <IconX size={16} />
                                </button>
                            </div>
                        )}
                    </div>
                    <div className="flex justify-end">
                        <PrimaryButton className='ms-auto' type='submit'>Send<span className='ml-1'><IconSend size={14} /></span></PrimaryButton>
                    </div>
                </form>
            </Card>
                </>
            )}
            <Card className='dark:bg-zinc-900 dark:border-zinc-800 shadow-none'>
                <h1 className="font-bold">Approval History</h1>
                {order.approved.map(approval => (
                    <>
                        <div className="flex justify-between">
                            <div>
                                <p>{approval.status}</p>
                                <small>{approval.created_at}</small>
                            </div>
                            <img src={`/images/orders/approvals/${approval.image_name}`} alt={approval.image_name} className='rounded-lg h-12' />
                        </div>
                    </>
                ))}
            </Card>
            </div>
        </>
    );
};

export default SendDesign;
