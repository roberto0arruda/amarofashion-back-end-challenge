<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->group(['prefix' => 'api'], function () use ($router) {
    $router->get('products',  ['uses' => 'ProductController@getAll']);
    $router->get('products/{id}', ['uses' => 'ProductController@getOne']);
    $router->post('products', ['uses' => 'ProductController@create']);
    $router->put('products/{id}', ['uses' => 'ProductController@update']);
    $router->delete('products/{id}', ['uses' => 'ProductController@delete']);

});
