import React, { useState, useEffect, useRef } from 'react';
import Echo from 'laravel-echo';
import axios from 'axios';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, Link } from '@inertiajs/react';
import classNames from 'classnames';
import PrimaryButton from '@/Components/PrimaryButton';
import { Card } from 'flowbite-react';
import { IconPaperclip, IconSearch, IconSend } from '@tabler/icons-react';
import Message from '@/Components/ChatBox/Message';
import TextInput from '@/Components/TextInput';
import SecondaryButton from '@/Components/SecondaryButton';



const Chat = ({ auth, chats }) => {
    const [messages, setMessages] = useState('');
    const [currentMessages, setCurrentMessages] = useState(messages);
    const [message, setMessage] = useState('');
    const [userChat, setUserChat] = useState(chats.filter(chat => chat.type === 'User'));
    const [orderChat, setOrderchat] = useState(chats.filter(chat => chat.type === 'Order'));
    const [file, setFile] = useState(null);
    const [chatRoom, setChatRoom] = useState(null);
    const [searchTerm, setSearchTerm] = useState('');


    const scroll = useRef();

    useEffect(() => {
        if (chatRoom) {
            window.Echo.private(`chat.${chatRoom.id}`)
                .listen('MessageSent', (e) => {
                    fetchMessages(chatRoom.user_id);
                });

            return () => {
                window.Echo.leaveChannel(`chat.${chatRoom.id}`);
            };
        }
    }, [chatRoom]);

    useEffect(() => {
        scrollToBottom();
    }, [messages]);

    const fetchMessages = async (user_id) => {
        try {
            const response = await axios.get(`/api/chat/${user_id}`);
            setMessages(response.data.messages);
            setChatRoom(response.data.chatRoom);
            scrollToBottom();
        } catch (error) {
            console.error("Error fetching messages:", error.response ? error.response.data : error.message);
        }
    };

    const fetchOrderMessages = async (order_id) => {
        try {
            const response = await axios.get(`/api/order-chat/${order_id}`);
            setMessages(response.data.messages);
            setChatRoom(response.data.chatRoom);
            scrollToBottom();
        } catch (error) {
            console.error("Error fetching messages:", error.response ? error.response.data : error.message);
        }
    };

    console.log(chatRoom);

    const scrollToBottom = () => {
        if (scroll.current) {
            scroll.current.scrollIntoView();
        }
    };

    const handleSubmit = (e) => {
        e.preventDefault();

        const formData = new FormData();
        formData.append('user_id', auth.user.id);
        formData.append('message', message);
        formData.append('chat_room_id', chatRoom.id);
        if (file) {
            file.forEach(f => formData.append('file[]', f));
        }


        axios.post('/messages', formData).then((response) => {
            const newMessage = {
                id: response.data.id,
                user: response.data.user,
                message: response.data.message,
                file_path: response.data.file,
            };

            console.log(file)
            setMessage('');
            setFile(null);
        }).catch((error) => {
            console.error('Error sending message:', error);
        });
    };


    const filteredOrders = orderChat.filter(user =>
        user.name.toLowerCase().includes(searchTerm.toLowerCase())
    );

    return (
        <AuthenticatedLayout
            user={auth.user}
            header={<h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Chats</h2>}
        >
            <Head title="Chats" />



            <div className="py-12 dark:text-gray-200">
                <div className=" max-w-7xl mx-auto sm:px-6 lg:px-8">
                    <div className="flex flex-col md:flex-row gap-4 justify-between">
                        <Card className='hidden md:block dark:bg-zinc-900 dark:border-zinc-800 shadow-none w-1/3'>
                            <h1 className="font-bold text-xl">Chats</h1>
                            <div className="h-full">
                                <div className='mb-4'>
                                    {/* <h1 className="mb-2 text-sm">Talk to Customer Service</h1> */}
                                    {userChat && userChat.map(chat => (
                                        <>
                                            <div
                                                key={chat.id}
                                                className={classNames('p-2 rounded-lg flex gap-4 items-center cursor-pointer', {
                                                    'bg-teal-100 dark:bg-aqua/25': chatRoom && chat.id === chatRoom.user.id
                                                })}
                                                onClick={() => fetchMessages(chat.user_id)}
                                            >
                                                <img
                                                    src={`/images/customers/${chat.image != null ? chat.image : 'profile.jpg'}`}
                                                    alt=""
                                                    className='h-10 rounded-full'
                                                />
                                                <div>
                                                    <p className="font-bold text-ellipsis">Customer Service</p>
                                                    {chat.chatroom && chat.chatroom.lastmessage && (
                                                        <p className='text-sm text-gray-500'>{chat.chatroom.lastmessage.message}</p>
                                                    )}
                                                </div>
                                            </div>
                                        </>
                                    ))}
                                </div>
                                <div>
                                    <h1 className="text-sm font-bold mb-2">Orders</h1>
                                    <div className="mb-4 relative">
                                        <TextInput
                                            placeholder="Search Order"
                                            className="w-full pl-10"
                                            value={searchTerm}
                                            onChange={(e) => setSearchTerm(e.target.value)}
                                        />
                                        <div className="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                            <IconSearch />
                                        </div>
                                    </div>
                                    {filteredOrders && filteredOrders.map(order => (
                                        <>
                                            <div
                                                key={order.id}
                                                className={classNames('p-2 rounded-lg flex gap-4 items-center cursor-pointer', {
                                                    'bg-teal-100 dark:bg-aqua/25': ''
                                                })}
                                                onClick={() => fetchOrderMessages(order.order_id)}
                                            >
                                                <img
                                                    src={`/images/customers/${order.image != null ? order.image : 'profile.jpg'}`}
                                                    alt=""
                                                    className='h-10 rounded-full'
                                                />
                                                <div>
                                                    <p className="font-bold text-ellipsis">{order.name}</p>
                                                    {order.chatroom && order.chatroom.lastmessage && (
                                                        <p className='text-sm text-gray-500'>{order.chatroom.lastmessage.message}</p>
                                                    )}
                                                </div>
                                            </div>
                                        </>
                                    ))}
                                </div>
                            </div>
                        </Card>
                        <Card className=' md:hidden dark:bg-zinc-900 dark:border-zinc-800 shadow-none w-full'>
                            <h1 className="font-bold text-xl">Chats</h1>
                            <div className="h-full">
                                <div className='mb-4'>
                                <div className="mb-4 relative">
                                        <TextInput
                                            placeholder="Search Order"
                                            className="w-full pl-10"
                                            value={searchTerm}
                                            onChange={(e) => setSearchTerm(e.target.value)}
                                        />
                                        <div className="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                            <IconSearch />
                                        </div>
                                    </div>
                                    {/* <h1 className="mb-2 text-sm">Talk to Customer Service</h1> */}

                                </div>
                                <div className='flex flex-row overflow-x-auto text-center'>
                                {userChat && userChat.map(chat => (
                                        <>
                                            <div
                                                key={chat.id}
                                                className={classNames('p-2 rounded-lg flex flex-col gap-4 items-center cursor-pointer', {
                                                    'bg-teal-100 dark:bg-aqua/25': chatRoom && chat.id === chatRoom.user.id
                                                })}
                                                onClick={() => fetchMessages(chat.user_id)}
                                            >
                                                <img
                                                    src={`/images/customers/${chat.image != null ? chat.image : 'profile.jpg'}`}
                                                    alt=""
                                                    className='h-10 rounded-full'
                                                />
                                                <div>
                                                    <p className="font-bold text-ellipsis text-xs">Customer Service</p>

                                                </div>
                                            </div>
                                        </>
                                    ))}

                                    {filteredOrders && filteredOrders.map(order => (
                                        <>
                                            <div
                                                key={order.id}
                                                className={classNames('p-2 rounded-lg flex flex-col gap-4 items-center cursor-pointer', {
                                                    'bg-teal-100 dark:bg-aqua/25': ''
                                                })}
                                                onClick={() => fetchOrderMessages(order.order_id)}
                                            >
                                                <img
                                                    src={`/images/customers/${order.image != null ? order.image : 'profile.jpg'}`}
                                                    alt=""
                                                    className='h-10 rounded-full'
                                                />
                                                <div>
                                                    <p className="font-bold text-xs text-ellipsis">{order.name}</p>

                                                </div>
                                            </div>
                                        </>
                                    ))}
                                </div>
                            </div>
                        </Card>
                        <Card className='dark:bg-zinc-900 dark:border-zinc-800 shadow-none w-full'>
                            <ChatContent
                                chatRoom={chatRoom && chatRoom}
                                order={chatRoom && (chatRoom.type === 'Order' && chatRoom.order.latestapproved)}
                                messages={messages}
                                handleSubmit={handleSubmit}
                                message={message}
                                setMessage={setMessage}
                                file={file}
                                setFile={setFile}
                                scroll={scroll}
                                user_id={auth.user.id}
                            />
                        </Card>
                        {/* <Card className='dark:bg-zinc-900 dark:border-zinc-800 shadow-none w-50'>

                        </Card> */}
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
};

export default Chat;

const ChatContent = ({ chatRoom, order, messages, handleSubmit, message, setMessage, file, setFile, scroll, user_id }) => {
    const fileInputRef = useRef(null);

    const handleFileClick = () => {
        fileInputRef.current.click();
    };

    const handleFileChange = (e) => {
        setFile([...file, ...Array.from(e.target.files)]);
    };

    const handleRemoveFile = (index) => {
        setFile(file.filter((_, i) => i !== index));
    };



    return (
        <div className="p-2 dark:text-zinc-100">

            <h1 className="font-bold text-xl mb-4">{chatRoom ? chatRoom.name : 'Chat Box'}</h1>
            <div className="relative">
                {order && (
                <>
                    <Card className='absolute inset-x-0 animate-pulse bg-gradient-to-r from-aqua to-purple-500 dark:border-zinc-800 mb-4'>
                        <div className="w-full flex gap-4 justify-between">
                            <div>
                                <p className="font-extrabold text-xl text-zinc-900">Waiting for Approval</p>
                                <p className='text-zinc-900'>The artist sent you the design for this particular order. Check it out.</p>
                            </div>
                            <div>
                                <Link href={route('orders.approval', chatRoom.order.id)}>
                                    <SecondaryButton>
                                        Check
                                    </SecondaryButton>
                                </Link>
                            </div>
                        </div>
                    </Card>
                </>
            )}
            </div>
            <div className="chat-box overflow-y-auto h-[calc(100vh-350px)] no-scrollbar py-4">
                {messages && messages.map((msg, index) => (
                    <>
                        <Message key={msg.id} message={msg} user_id={user_id} previousMessage={messages[index - 1]} />

                    </>
                ))}
                <span ref={scroll}></span>
            </div>
            <div className="p-2 dark:bg-zinc-800 rounded-lg">
                <form onSubmit={handleSubmit} className="flex flex-col gap-4">
                    <div className="flex flex-wrap gap-2">
                        {file && file.map((f, index) => (
                            <div key={index} className="relative">
                                <img
                                    src={URL.createObjectURL(f)}
                                    alt="uploaded preview"
                                    className="h-20 w-20 object-cover rounded-lg"
                                />
                                <button
                                    type="button"
                                    onClick={() => handleRemoveFile(index)}
                                    className="absolute top-0 right-0 bg-white rounded-full p-1 text-red-500"
                                >
                                    <IconX />
                                </button>
                            </div>
                        ))}
                    </div>
                    <div className="flex gap-4 items-center">
                        <button type="button" onClick={handleFileClick} className="text-gray-500 hover:text-gray-700 dark:hover:text-gray-300">
                            <IconPaperclip />
                        </button>
                        <input
                            type="file"
                            ref={fileInputRef}
                            onChange={handleFileChange}
                            multiple
                            style={{ display: 'none' }}
                        />
                        <input
                            type="text"
                            value={message}
                            onChange={(e) => setMessage(e.target.value)}
                            placeholder="Type a message"
                            className="w-full dark:bg-zinc-800 border-0"
                        />
                        <button type="submit" className="text-gray-500 hover:text-gray-700 dark:hover:text-gray-300">
                            <IconSend />
                        </button>
                    </div>
                </form>
            </div>
        </div>
    );
};
