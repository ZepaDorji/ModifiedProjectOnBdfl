require 'rails_helper'
RSpec.describe  CategoryProduct do

  
        it 'creates products_category' do
            user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
            product = Product.create(name: 'Shirt S', price: 234.22, description: 'This is a shirt')
            category = user.categories.create(name: 'Shirt')
            params = {
                category_product: {
                    category_id: category.id,
                    product_id: product.id
                }
            } 
                
            post api_v1_shop_category_products_path, params: params
            expect(status).to eq(200)
            expect(CategoryProduct.count).to eq(1)
        
        end


end