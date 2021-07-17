require 'rails_helper'

RSpec.describe Product do

    context 'Create Product' do
        it 'creates category' do
            params = {
                product: {
                    name: 'Shoe', 
                    price: 1232.2,
                    description: Faker::ProgrammingLanguage.name
                }
            }
            post api_v1_shop_products_path, params: params
            expect(status).to eq(200)
            expect(Product.count).to eq(1)
            expect(Product.first.name).to eq('Shoe')
            expect(Product.first.price).to eq(1232.2)
            expect(Product.first.description).to eq(params[:product][:description])
        end

    end
end
