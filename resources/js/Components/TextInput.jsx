import { forwardRef, useEffect, useRef } from 'react';

export default forwardRef(function TextInput({ type = 'text', className = '', isFocused = false, ...props }, ref) {
    const input = ref ? ref : useRef();

    useEffect(() => {
        if (isFocused) {
            input.current.focus();
        }
    }, []);

    return (
        <input
            {...props}
            type={type}
            className={
                'border-zinc-300 dark:border-zinc-700 dark:bg-zinc-800 dark:text-zinc-300 focus:border-aqua dark:focus:border-aqua focus:ring-aqua dark:focus:ring-aqua rounded-md shadow-sm ' +
                className
            }
            ref={input}
        />
    );
});
