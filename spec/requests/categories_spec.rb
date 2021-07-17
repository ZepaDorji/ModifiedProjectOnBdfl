require 'rails_helper'

RSpec.describe Category do

    context 'Create Category' do
        it 'creates category' do
            user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
            params = {
                category: {
                    name: 'Shirt', 
                    id: user.id
                }
            } 
            post api_v1_shop_categories_path, params: params
            expect(status).to eq(200)
            expect(Category.count).to eq(1)
        end

        it 'list all categories for a user' do
            user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
            params = {
                category: {
                    name: 'Shirt', 
                    id: user.id
                }
            } 
            post api_v1_shop_categories_path, params: params
            post api_v1_shop_categories_path, params: params
            post api_v1_shop_categories_path, params: params

            get api_v1_shop_categories_path, params: params
            expect(status).to eq(200)
            expect(Category.count).to eq(3)
        end

        it 'show detail of a category' do
            user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
            params = {
                category: {
                    name: 'Shirt', 
                    id: user.id
                }
            } 
            post api_v1_shop_categories_path, params: params

            get api_v1_shop_category_path(Category.first.id), params: params
            expect(status).to eq(200)
            expect(Category.count).to eq(1)
        end
        
        it 'updates a category' do
            user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
            params = {
                category: {
                    name: 'Shirt', 
                    id: user.id,
                }
            } 
            post api_v1_shop_categories_path, params: params

            put api_v1_shop_category_path(Category.first.id), params: { category: { name: 'Pant', id: user.id } }
            expect(status).to eq(200)
            expect(Category.count).to eq(1)
            expect(Category.first.name).to eq('Pant')
        end

        it 'deletes a category' do
            user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
            params = {
                category: {
                    name: 'Shirt', 
                    id: user.id
                }
            } 
            post api_v1_shop_categories_path, params: params

            delete api_v1_shop_category_path(Category.first.id), params: { category: { id: user.id } }
            expect(status).to eq(200)
            expect(Category.count).to eq(0)
        end
    end
end
