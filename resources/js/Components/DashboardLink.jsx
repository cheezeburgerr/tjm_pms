import { Link } from '@inertiajs/react';

export default function NavLink({ active = false, className = '', children, ...props }) {
    return (
        <Link
            {...props}
            className={
                'w-full p-1  transition duration-150 ease-in-out focus:outline-none ' +
                (active
                    ? 'border-0 border-l-8 border-aqua text-zinc-700 font-bold dark:text-zinc-100 focus:border-teal-700'
                    : 'border-transparent text-zinc-500 dark:text-zinc-400 hover:text-zinc-700 dark:hover:text-zinc-300 hover:border-zinc-300 dark:hover:border-zinc-700 focus:text-zinc-700 dark:focus:text-zinc-300 focus:border-zinc-300 dark:focus:border-zinc-700 ') +
                className
            }
        >
            {children}
        </Link>
    );
}
