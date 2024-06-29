import moment from "moment";
import React from "react";
import { useState } from "react";

const Message = ({ user_id, message, previousMessage }) => {
    const [showTime, setShowTime] = useState(false);

    // Check if previous message exists and is from the same user within a minute
    const shouldMerge = previousMessage && previousMessage.user_id === message.user_id &&
        moment(message.created_at).diff(moment(previousMessage.created_at), 'minutes') < 5;

    return (
        <div className={`my-2 ${user_id === message.user_id ? "text-right" : ""}`}>
            {!shouldMerge && (
                <div className="">

                    <small className="text-gray-500">{message.user.name}</small>
                    {showTime && (
                        <>
                            <small className="text-gray-500 cursor-pointer" >
                        {moment(message.created_at).format('MMMM Do YYYY - HH:mm')}
                    </small>
                        </>
                    )}
                </div>
            )}
            <div className={`flex ${user_id === message.user_id ? 'justify-end' : 'justify-start'}`}>
                <div className={`p-2 px-4 rounded-lg ${user_id === message.user_id ? "bg-aqua rounded-br-none" : "bg-gray-50 dark:bg-gray-500 rounded-bl-none"} max-w-48`} role="alert" onClick={() => setShowTime(!showTime)}>
                    {message.message}
                </div>
            </div>
        </div>
    );
};

export default Message;
