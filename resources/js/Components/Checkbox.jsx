export default function Checkbox({ className = '', ...props }) {
    return (
        <input
            {...props}
            type="checkbox"
            className={
                'rounded dark:bg-zinc-900 border-zinc-300 dark:border-zinc-700 text-aqua shadow-sm focus:ring-aqua dark:focus:ring-aqua dark:focus:ring-offset-zinc-800 ' +
                className
            }
        />
    );
}
