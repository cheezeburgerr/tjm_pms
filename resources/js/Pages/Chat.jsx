import React, { useState, useEffect } from 'react';
import Echo from 'laravel-echo';
import axios from 'axios';


const Chat = ({auth, chatRoom, messages }) => {
    const [currentMessages, setCurrentMessages] = useState(messages);
    const [message, setMessage] = useState('');
    const [file, setFile] = useState(null);

    useEffect(() => {


        window.Echo.private(`chat.${chatRoom.id}`)
            .listen('MessageSent', (e) => {
                setCurrentMessages((prevMessages) => [e.message, ...prevMessages]);
            });

        return () => {
            window.Echo.leaveChannel(`chat.${chatRoom.id}`);
        };
    }, [chatRoom.id]);

    const handleSubmit = (e) => {
        e.preventDefault();

        const formData = new FormData();
        formData.append('user_id', auth.user.id);
        formData.append('message', message);
        formData.append('chat_room_id', chatRoom.id);
        if (file) {
            formData.append('file', file);
        }

        // Send message via Inertia POST request
        axios.post('/messages', formData).then((response) => {
            const newMessage = {
                id: response.data.id, // Assuming your API returns the new message ID
                user: response.data.user, // Assuming your API returns the user object
                message: response.data.message,
                file_path: response.data.file_path,
            };

            // Update messages state immediately after sending
            setCurrentMessages((prevMessages) => [newMessage, ...prevMessages]);

            // Clear message and file input
            setMessage('');
            setFile(null);
        }).catch((error) => {
            console.error('Error sending message:', error);
        });
    };

    return (
        <div>
            <div className="chat-box">
                {currentMessages.map((msg) => (
                    <div key={msg.id}>
                        <p> {msg.message}</p>
                        {msg.file_path && (
                            <img src={msg.file_path} alt="Uploaded file" style={{ maxWidth: '200px' }} />
                        )}
                    </div>
                ))}
            </div>
            <form onSubmit={handleSubmit}>
                <input
                    type="text"
                    value={message}
                    onChange={(e) => setMessage(e.target.value)}
                    placeholder="Type a message"
                />
                <input
                    type="file"
                    onChange={(e) => setFile(e.target.files[0])}
                />
                <button type="submit">Send</button>
            </form>
        </div>
    );
};

export default Chat;
