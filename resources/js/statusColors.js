// statusColors.js

export const STATUS_COLORS = {
    Pending: 'font-bold text-sm bg-yellow-400 text-zinc-100 rounded-full px-2 text-gray-100',
    Designing: 'font-bold text-sm bg-blue-500 rounded-full px-2 text-zinc-100',
    Printing: 'font-bold text-sm bg-purple-500 rounded-full px-2 text-zinc-100',
    Sewing: 'font-bold text-sm bg-teal-500 rounded-full px-2',
    Cancelled: 'font-bold text-sm bg-red-500 rounded-full px-2',
    Finished: 'font-bold text-sm bg-green-500 rounded-full px-2',
    Default: 'font-bold text-sm bg-gray-400 rounded-full px-2',
};



export const getStatusColor = (status) => {
    return STATUS_COLORS[status] || STATUS_COLORS.Default;
};
