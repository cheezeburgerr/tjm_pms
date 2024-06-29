import React, { useState, useEffect } from 'react';
import axios from 'axios';
import PrimaryButton from '@/Components/PrimaryButton';
import SecondaryButton from '@/Components/SecondaryButton';
import TextInput from '@/Components/TextInput';
import { IconX } from '@tabler/icons-react';

export default function LineupForm({ data, setData, prevStep, products }) {
    // Ensure that data.lineups is initialized properly
    data.lineups = data.lineups || [];

    const [rows, setRows] = useState(data.lineups.length > 0 ? data.lineups : [{ id: 0 }]);

    const addRow = () => {
        setRows(prevRows => [...prevRows, { id: prevRows.length }]);
    };

    const removeRow = (id) => {
        setRows(prevRows => prevRows.filter(row => row.id !== id));
    };

    // Update data.lineups whenever rows change
    useEffect(() => {
        setData('lineups', rows);

    }, [rows]);

    // Update data with the input values for each row
    const handleInputChange = (rowId, field, value) => {
        setRows(prevRows =>
            prevRows.map(row => {
                if (row.id === rowId) {
                    return {
                        ...row,
                        [field]: value
                    };
                }
                return row;
            })
        );

        setData(prevData => ({
            ...prevData,
            lineups: prevData.lineups.map(row => {
                if (row.id === rowId) {
                    return {
                        ...row,
                        [field]: value
                    };
                }
                return row;
            })
        }));

        console.log(data)
    };




    return (
        <div>
            <h2 className='mb-6'>Select Lineup</h2>
            <form className="relative overflow-x-auto  sm:rounded-lg" >
                <div className="mb-3 sticky top-15 bg-light p-3">
                    <div className="row">
                        <div className="flex justify-between">
                            <div></div>
                            <div className="flex items-center space-x-2">
                                <SecondaryButton onClick={addRow} className="btn btn-dark btn-sm">Add Row</SecondaryButton>
                                {/* <PrimaryButton type="submit" className="btn btn-primary">Submit</PrimaryButton> */}
                            </div>
                        </div>
                    </div>
                </div>

                <div className="row scrollable card p-3">
                    <table className="w-full text-sm text-left rtl:text-right text-zinc-500">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Name</th>
                                <th>Number/Position</th>
                                <th>Classification</th>
                                <th>Gender</th>
                                <th>Upper Size</th>
                                <th>Lower Size</th>
                                <th>Note/Remarks</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {rows.map(row => (
                                <tr key={row.id}>
                                    <td>
                                        <select className="w-full md:w-36 border-zinc-800 rounded-md dark:bg-zinc-900" value={row.product} onChange={e => handleInputChange(row.id, 'product', e.target.value)} required>
                                            <option value="" disabled selected>Select Product</option>
                                            {data.products.map(product => (
                                                <>
                                                <option value={product.id}>{product.product_name}</option>
                                                </>
                                            ))}
                                        </select>
                                    </td>
                                    <td><TextInput className="w-60" type="text" value={row.player_name} onChange={e => handleInputChange(row.id, 'player_name', e.target.value)} placeholder="Name" required /></td>
                                    <td><TextInput className="w-full md:w-36" type="text" value={row.player_details} onChange={e => handleInputChange(row.id, 'player_details', e.target.value)} placeholder="Number" /></td>
                                    <td>
                                        <select className="w-full md:w-36 border-zinc-800 rounded-md dark:bg-zinc-900" value={row.classification} onChange={e => handleInputChange(row.id, 'classification', e.target.value)} required>
                                            <option value="" disabled selected>Select Classification</option>
                                            <option value="Adult">Adult</option>
                                            <option value="Kid">Kid</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select className="w-full md:w-24 border-zinc-800 rounded-md dark:bg-zinc-900" value={row.gender} onChange={e => handleInputChange(row.id, 'gender', e.target.value)} required>
                                            <option value="" disabled selected>Select Gender</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select className="w-20 border-zinc-800 rounded-md dark:bg-zinc-900" value={row.upper_size} onChange={e => handleInputChange(row.id, 'upper_size', e.target.value)} required>
                                            <option value="" disabled selected>Select Size</option>
                                            <option value="XS">XS</option>
                                            <option value="S">S</option>
                                            <option value="M">M</option>
                                            <option value="L">L</option>
                                            <option value="XL">XL</option>
                                            <option value="XXL">XXL</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select className="w-20 border-zinc-800 rounded-md dark:bg-zinc-900" value={row.lower_size} onChange={e => handleInputChange(row.id, 'lower_size', e.target.value)} required>
                                            <option value="" disabled selected>Select Size</option>
                                            <option value="XS">XS</option>
                                            <option value="S">S</option>
                                            <option value="M">M</option>
                                            <option value="L">L</option>
                                            <option value="XL">XL</option>
                                            <option value="XXL">XXL</option>
                                        </select>
                                    </td>
                                    <td><TextInput className="w-full md:w-36" type="text" value={row.remarks} onChange={e => handleInputChange(row.id, 'remarks', e.target.value)} placeholder="" /></td>
                                    <td><IconX onClick={() => removeRow(row.id)} className='cursor-pointer'/></td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            </form>
        </div>
    );
}
