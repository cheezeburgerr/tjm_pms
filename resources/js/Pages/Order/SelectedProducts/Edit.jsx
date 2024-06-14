import React, { useState, useEffect } from 'react';
import { Head, useForm } from '@inertiajs/react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import PrimaryButton from '@/Components/PrimaryButton';
import { Card, Label, Radio } from 'flowbite-react';

export default function OrderDetails({ auth, selectedProduct: initialSelectedProduct, product, order }) {
    const { data, setData, put, processing, errors } = useForm({
        selectedProduct: initialSelectedProduct,
        subtotal: calculateInitialSubtotal(), // Initialize subtotal in form state
    });

    const [subtotal, setSubtotal] = useState(data.subtotal);

    // Calculate initial subtotal
    function calculateInitialSubtotal() {
        let initialSubtotal = product.product_price;
        initialSelectedProduct.variations.forEach(v => {
            const selectedVariation = product.categories.flatMap(category => category.variation).find(variation => variation.id === v.variation_id);
            if (selectedVariation) {
                initialSubtotal += selectedVariation.variation_price;
            }
        });
        return initialSubtotal;
    }

    // Handle radio button change
    const handleRadioChange = (categoryId, variationId, variationPrice) => {
        const updatedVariations = data.selectedProduct.variations.map(v =>
            v.category_id === categoryId ? { ...v, variation_id: variationId } : v
        );

        const currentVariation = data.selectedProduct.variations.find(v => v.category_id === categoryId);
        const currentVariationPrice = currentVariation ? product.categories.flatMap(category => category.variation).find(variation => variation.id === currentVariation.variation_id)?.variation_price || 0 : 0;
        const newSubtotal = subtotal - currentVariationPrice + variationPrice;

        setData({
            ...data,
            selectedProduct: { ...data.selectedProduct, variations: updatedVariations },
            subtotal: newSubtotal, // Update subtotal in form state
        });

        setSubtotal(newSubtotal);
    };

    // Handle form submission
    const handleSubmit = (e) => {
        e.preventDefault();
        put(route('order-product.update', initialSelectedProduct.id));
    };

    return (
        <AuthenticatedLayout
            user={auth.user}
            header={<h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Edit Ordered Product</h2>}
        >
            <Head title="Edit Ordered Product" />

            <div className="py-12">
                <div className="max-w-7xl mx-auto sm:px-6 lg:px-8 dark:text-gray-200 md:w-1/2 2xl:w-1/3">
                    <h1 className=' font-bold mb-6 text-xl'>Edit Ordered Product</h1>
                    <Card>
                        <form onSubmit={handleSubmit}>
                            <p>{product.product_name}</p>
                            {product.categories.map(category => (
                                <div key={category.id}>
                                    <p>{category.category_name}</p>
                                    {category.variation.map(variation => (
                                        <div key={variation.id}>
                                            <Radio
                                                type="radio"
                                                name={`category-${category.id}`}
                                                id={`variation-${variation.id}`}
                                                data-price={variation.variation_price}
                                                checked={data.selectedProduct.variations.some(v => v.variation_id === variation.id)}
                                                onChange={() => handleRadioChange(category.id, variation.id, variation.variation_price)}
                                            />
                                            <Label htmlFor={`variation-${variation.id}`}>{variation.variation_name}</Label>
                                        </div>
                                    ))}
                                </div>
                            ))}
                            <p>Subtotal: ${subtotal.toFixed(2)}</p>
                            <PrimaryButton className="mt-4" processing={processing}>Save</PrimaryButton>
                        </form>
                    </Card>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
