<?php

use App\Product;
use Illuminate\Database\Seeder;

class ProductsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $items = [
            [
                "name" => "VESTIDO TRICOT CHEVRON",
                'tags' => ["balada", "neutro", "delicado", "festa"]
            ],
            [
                "name"=> "VESTIDO MOLETOM COM CAPUZ MESCLA",
                "tags"=> ["casual", "metal"]
            ],
            [
                "name"=> "VESTIDO CURTO MANGA LONGA LUREX",
                "tags"=> ["colorido", "metal", "delicado", "estampas", "passeio"]
            ]
        ];

        foreach ($items as $item) {
            Product::create($item);
        }
    }
}
