import React, { useState } from 'react';
import InputLabel from '@/Components/InputLabel';
import PrimaryButton from '@/Components/PrimaryButton';
import TextInput from '@/Components/TextInput';
import EmployeeLayout from '@/Layouts/EmployeeLayout';
import { Head, useForm } from '@inertiajs/react';
import { IconPlus, IconX } from '@tabler/icons-react';

export default function Dashboard({ auth }) {
    const { data, setData, post, processing, errors } = useForm({
        product_name: '',
        product_price: '',
        image: null, // Add image to the form data
        categories: [{ name: '', variations: [{ name: '', price: '' }] }]
    });

    const addCategory = () => {
        setData('categories', [...data.categories, { name: '', variations: [{ name: '', price: '' }] }]);
    };

    const removeCategory = (index) => {
        setData('categories', data.categories.filter((_, i) => i !== index));
    };

    const handleCategoryChange = (index, event) => {
        const newCategories = [...data.categories];
        newCategories[index][event.target.name] = event.target.value;
        setData('categories', newCategories);
    };

    const addVariation = (categoryIndex) => {
        const newCategories = [...data.categories];
        newCategories[categoryIndex].variations.push({ name: '', price: '' });
        setData('categories', newCategories);
    };

    const removeVariation = (categoryIndex, variationIndex) => {
        const newCategories = [...data.categories];
        newCategories[categoryIndex].variations = newCategories[categoryIndex].variations.filter((_, i) => i !== variationIndex);
        setData('categories', newCategories);
    };

    const handleVariationChange = (categoryIndex, variationIndex, event) => {
        const newCategories = [...data.categories];
        newCategories[categoryIndex].variations[variationIndex][event.target.name] = event.target.value;
        setData('categories', newCategories);
    };

    const handleImageChange = (e) => {
        setData('image', e.target.files[0]);
    };

    const handleSubmit = (e) => {
        e.preventDefault();

        const formData = new FormData();
        formData.append('product_name', data.product_name);
        formData.append('product_price', data.product_price);
        formData.append('image', data.image);
        data.categories.forEach((category, index) => {
            formData.append(`categories[${index}][name]`, category.name);
            category.variations.forEach((variation, vIndex) => {
                formData.append(`categories[${index}][variations][${vIndex}][name]`, variation.name);
                formData.append(`categories[${index}][variations][${vIndex}][price]`, variation.price);
            });
        });

        post(route('products.store'), {
            data: formData,
            headers: {
                'Content-Type': 'multipart/form-data'
            }
        });
    };

    return (
        <EmployeeLayout
            user={auth.employee}
            header={<h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Products</h2>}
        >
            <Head title="Add Product" />

            <div className="dark:text-gray-100">
                <div className="flex justify-between">
                    <h1 className='text-2xl font-bold mb-8'>Add Product</h1>
                </div>

                <form onSubmit={handleSubmit}>
                    <div className="md:columns-3">
                        <div className="mb-8">
                            <InputLabel htmlFor="product_name">Product Name</InputLabel>
                            <TextInput
                                type="text"
                                name="product_name"
                                id="product_name"
                                value={data.product_name}
                                onChange={e => setData('product_name', e.target.value)}
                                className="w-full"
                            />
                            {errors.product_name && <div className="text-red-500">{errors.product_name}</div>}
                        </div>
                        <div className="mb-4">
                            <InputLabel htmlFor="product_price">Product Price</InputLabel>
                            <TextInput
                                type="number"
                                name="product_price"
                                id="product_price"
                                value={data.product_price}
                                onChange={e => setData('product_price', e.target.value)}
                            />
                            {errors.product_price && <div className="text-red-500">{errors.product_price}</div>}
                        </div>
                        <div className="mb-8">
                        <InputLabel htmlFor="image">Product Image</InputLabel>
                        <TextInput
                            type="file"
                            name="image"
                            id="image"
                            onChange={handleImageChange}
                            className="w-full"
                        />
                        {errors.image && <div className="text-red-500">{errors.image}</div>}
                    </div>
                    </div>



                    <div className="mb-8">
                        <h3 className="text-xl font-semibold mb-4">Categories</h3>
                        {data.categories.map((category, categoryIndex) => (
                            <div key={categoryIndex} className="mb-6 flex flex-wrap">
                                <div className="flex items-center mb-2">
                                    <TextInput
                                        type="text"
                                        name="name"
                                        placeholder="Category Name"
                                        value={category.name}
                                        onChange={(e) => handleCategoryChange(categoryIndex, e)}
                                    />
                                    <PrimaryButton type="button" onClick={() => removeCategory(categoryIndex)} className="ml-2">
                                        <IconX size={16}/>
                                    </PrimaryButton>
                                </div>
                                <div className="ml-4">
                                    <h4 className="text-lg font-semibold mb-2">Variations</h4>
                                    {category.variations.map((variation, variationIndex) => (
                                        <div key={variationIndex} className="flex items-center mb-2">
                                            <TextInput
                                                type="text"
                                                name="name"
                                                placeholder="Variation Name"
                                                value={variation.name}
                                                onChange={(e) => handleVariationChange(categoryIndex, variationIndex, e)}
                                            />
                                            <TextInput
                                                type="number"
                                                name="price"
                                                placeholder="Variation Price"
                                                value={variation.price}
                                                onChange={(e) => handleVariationChange(categoryIndex, variationIndex, e)}
                                                className="ml-2"
                                            />
                                            <PrimaryButton
                                                type="button"
                                                onClick={() => removeVariation(categoryIndex, variationIndex)}
                                                className="ml-2"
                                            >
                                                <IconX size={16}/>
                                            </PrimaryButton>
                                        </div>
                                    ))}
                                    <PrimaryButton type="button" onClick={() => addVariation(categoryIndex)}>
                                        Add Variation <IconPlus size={16}/>
                                    </PrimaryButton>
                                </div>
                            </div>
                        ))}
                        <PrimaryButton type="button" onClick={addCategory}>
                            Add Category <IconPlus size={16}/>
                        </PrimaryButton>
                    </div>

                    <PrimaryButton type="submit" disabled={processing}>
                        Submit
                    </PrimaryButton>
                </form>
            </div>
        </EmployeeLayout>
    );
}
