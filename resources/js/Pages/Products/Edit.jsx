import React, { useState, useEffect } from 'react';
import InputLabel from '@/Components/InputLabel';
import PrimaryButton from '@/Components/PrimaryButton';
import TextInput from '@/Components/TextInput';
import EmployeeLayout from '@/Layouts/EmployeeLayout';
import { Head, useForm } from '@inertiajs/react';

export default function EditProduct({ auth, product }) {
    const { data, setData, put, processing, errors } = useForm({
        product_name: product.product_name,
        product_price: product.product_price,
        categories: product.categories.map(category => ({
            category_id: category.id,
            category_name: category.category_name,
            variations: category.variation.map(variation => ({
                variation_id: variation.id,
                variation_name: variation.variation_name,
                variation_price: variation.variation_price
            }))
        }))
    });

    const addCategory = () => {
        setData('categories', [...data.categories, { category_name: '', variations: [{ variation_name: '', variation_price: '' }] }]);
    };

    const removeCategory = (index) => {
        setData('categories', data.categories.filter((_, i) => i !== index));
    };

    const handleCategoryChange = (index, event) => {
        const newCategories = [...data.categories];
        newCategories[index].category_name = event.target.value;
        setData('categories', newCategories);
    };

    const addVariation = (categoryIndex) => {
        const newCategories = [...data.categories];
        newCategories[categoryIndex].variations.push({ variation_name: '', variation_price: '' });
        setData('categories', newCategories);
    };

    const removeVariation = (categoryIndex, variationIndex) => {
        const newCategories = [...data.categories];
        newCategories[categoryIndex].variations.splice(variationIndex, 1);
        setData('categories', newCategories);
    };

    const handleVariationChange = (categoryIndex, variationIndex, event) => {
        const newCategories = [...data.categories];
        newCategories[categoryIndex].variations[variationIndex][event.target.name] = event.target.value;
        setData('categories', newCategories);
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        console.log('Submitting form data:', data); // Log the form data
        put(route('products.update', product.id))

    };

    return (
        <EmployeeLayout
            user={auth.employee}
            header={<h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Edit Product</h2>}
        >
            <Head title="Edit Product" />

            <div className="dark:text-gray-100">
                <div className="flex justify-between">
                    <h1 className='text-2xl font-bold mb-8'>Edit Product</h1>
                </div>

                <form onSubmit={handleSubmit}>
                    <div className="columns-2">
                        <div className="mb-4">
                            <InputLabel htmlFor="product_name">Product Name</InputLabel>
                            <TextInput
                                type="text"
                                name="product_name"
                                id="product_name"
                                value={data.product_name}
                                onChange={e => setData('product_name', e.target.value)}
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
                    </div>

                    <div className="mb-8">
                        <h3 className="text-xl font-semibold mb-4">Categories</h3>
                        {data.categories.map((category, categoryIndex) => (
                            <div key={categoryIndex} className="mb-6">
                                <div className="flex items-center mb-2">
                                    <TextInput
                                        type="text"
                                        name="category_name"
                                        placeholder="Category Name"
                                        value={category.category_name}
                                        onChange={(e) => handleCategoryChange(categoryIndex, e)}
                                    />
                                    <PrimaryButton type="button" onClick={() => removeCategory(categoryIndex)} className="ml-2">
                                        Remove Category
                                    </PrimaryButton>
                                </div>
                                <div className="ml-4">
                                    <h4 className="text-lg font-semibold mb-2">Variations</h4>
                                    {category.variations.map((variation, variationIndex) => (
                                        <div key={variation.id} className="flex items-center mb-2">
                                            <TextInput
                                                type="text"
                                                name="variation_name"
                                                placeholder="Variation Name"
                                                value={variation.variation_name}
                                                onChange={(e) => handleVariationChange(categoryIndex, variationIndex, e)}
                                            />
                                            <TextInput
                                                type="number"
                                                name="variation_price"
                                                placeholder="Variation Price"
                                                value={variation.variation_price}
                                                onChange={(e) => handleVariationChange(categoryIndex, variationIndex, e)}
                                                className="ml-2"
                                            />
                                            <PrimaryButton
                                                type="button"
                                                onClick={() => removeVariation(categoryIndex, variationIndex)}
                                                className="ml-2"
                                            >
                                                Remove Variation
                                            </PrimaryButton>
                                        </div>
                                    ))}
                                    <PrimaryButton type="button" onClick={() => addVariation(categoryIndex)}>
                                        Add Variation
                                    </PrimaryButton>
                                </div>
                            </div>
                        ))}
                        <PrimaryButton type="button" onClick={addCategory}>
                            Add Category
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
