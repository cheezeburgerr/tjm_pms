<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Department;
use App\Models\Equipment;
use App\Models\Products;
use App\Models\User;
use App\Models\Variation;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        // User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        // User::create([
        //     'user_id' => 'TJM_00001',
        //     'name' => 'Ian Soriano',
        //     'email' => 'iansoriano05@gmail.com',
        //     'user_type' => 'Employee',
        //     'contact_number' => '09685144938'   ,
        //     'address' => 'Urbiz',
        //     'is_supervisor' => 0,
        //     'password' => Hash::make('password')
        // ]);

        // Products::create([
        //     'product_name' => 'Fullset Jersey',
        //     'product_price' => 950.00,
        // ]);

        // Category::create([
        //     'category_name' => 'Jersey Type',
        //     'product_id' => 1,
        // ]);

        // Variation::create([
        //     'variation_name' => 'Normal Cut',
        //     'variation_price' => 0,
        //     'category_id' => 1
        // ]);

        // Variation::create([
        //     'variation_name' => 'NBA Cut',
        //     'variation_price' => 50,
        //     'category_id' => 1
        // ]);

        //  Department::create([
        //         'dept_name' => 'Artist',
        //     ]);

        //     Department::create([
        //         'dept_name' => 'Customer Service Representative',
        //     ]);
        //     Department::create([
        //         'dept_name' => 'Printing',
        //     ]);
        //     Department::create([
        //         'dept_name' => 'Checking',
        //     ]);
        //     Department::create([
        //         'dept_name' => 'Sewing',
        //     ]);

        //   User::create([
        //     'user_id' => 'TJM_00002',
        //     'name' => 'Cherry Corrales',
        //     'email' => 'cherrycorrales@gmail.com',
        //     'user_type' => 'Employee',empl
        //     'contact_number' => '09776765454',
        //     'address' => 'San Carlos',
        //     'is_supervisor' => 0,
        //     'dept_id' => 2,
        //     'password' => Hash::make('password')
        // ]);

        // User::create([
        //     'user_id' => 'TJM_00003',
        //     'name' => 'Floyd De Vera',
        //     'email' => 'floyddevera@gmail.com',
        //     'user_type' => 'Employee',
        //     'contact_number' => '09323434454',
        //     'address' => 'Binmaley',
        //     'is_supervisor' => 1,
        //     'dept_id' => 1,
        //     'password' => Hash::make('password')
        // ]);

        // Equipment::create([
        //     'equipment_name' => 'ATEXCO',
        //     'type' => 'Printer',
        //     'status' => 'Working'
        // ]);

        // Equipment::create([
        //     'equipment_name' => 'EPSON',
        //     'type' => 'Printer',
        //     'status' => 'Working'
        // ]);

        // Equipment::create([
        //     'equipment_name' => 'Tecjet',
        //     'type' => 'Printer',
        //     'status' => 'Working'
        // ]);

        // User::create([
        //     'user_id' => 'TJM_00004',
        //     'name' => 'Deither Ramos',
        //     'email' => 'deither@gmail.com',
        //     'user_type' => 'Employee',
        //     'contact_number' => '0977875453',
        //     'address' => 'San Carlos',
        //     'is_supervisor' => 0,
        //     'dept_id' => 3,
        //     'password' => Hash::make('password')
        // ]);

        User::create([
            'user_id' => 'ADM_00001',
            'name' => 'Joseph Mislang',
            'email' => 'josephmislang@gmail.com',
            'user_type' => 'Admin',
            'contact_number' => '09348874578',
            'address' => 'San Carlos',
            'is_supervisor' => 1,
            'password' => Hash::make('password')
        ]);
    }
}
