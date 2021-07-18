require 'rails_helper'
RSpec.describe Product do

    context 'Create Product' do
        it 'creates products' do
            params = {
                product: {
                    name: Faker::Book.title, 
                    price: Faker::Commerce.price,
                    description: Faker::String.random(length: 5..100)

                }
            }
            post api_v1_shop_products_path, params: params
            expect(status).to eq(200)
            expect(Product.count).to eq(1)
            expect(Product.first.name).to eq(params[:product][:name])
            expect(Product.first.price).to eq(params[:product][:price])
            expect(Product.first.description).to eq(params[:product][:description])
        end

    end

    context 'list Product' do
        it 'list all the products' do
            params = {
                product: {
                    name: Faker::Book.title, 
                    price: Faker::Commerce.price,
                    description: Faker::String.random(length: 5..100)
                }
            }
            post api_v1_shop_products_path, params: params
            post api_v1_shop_products_path, params: params

            get api_v1_shop_products_path, params: params
            expect(status).to eq(200)
            expect(Product.count).to eq(2)
        end

    end


    context 'Show Product' do
        it 'Show all the products' do
            params = {
                product: {
                    name: Faker::Book.title, 
                    price: Faker::Commerce.price,
                    description: Faker::String.random(length: 5..100)
                }
            }
            post api_v1_shop_products_path, params: params
            
            get api_v1_shop_product_path(Product.first.id), params: params
            expect(status).to eq(200)
            expect(Product.count).to eq(1)
        end

    end
    context 'Update Product' do
        it 'updates a product' do
            user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
            params = {
                product: {
                    name: Faker::Book.title, 
                    price: Faker::Commerce.price,
                    description: Faker::String.random(length: 5..100)
                }
            }
            post api_v1_shop_products_path, params: params

            put api_v1_shop_product_path(Product.first.id), params: { product: { name: 'RubyOnRails', id: user.id } }
            expect(status).to eq(200)
            expect(Product.count).to eq(1)
            expect(Product.first.name).to eq('RubyOnRails')
        end
    end

    context 'Destroy Product' do
        it 'Delete a product' do
            user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
            category = Category.create(name:'ApplePhone',id:user.id)
            params = {
                product: {
                    name: Faker::Book.title, 
                    price: Faker::Commerce.price,
                    description: Faker::String.random(length: 5..100),
                    id: category.id

                }
            }
            post api_v1_shop_products_path, params: params
            delete api_v1_shop_product_path(Product.first.id), params: { product:{id:category.id }}
            expect(status).to eq(200)
            expect(Product.count).to eq(0)
        end
    end
end
