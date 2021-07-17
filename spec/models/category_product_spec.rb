require 'rails_helper'

RSpec.describe CategoryProduct, type: :model do
  context 'Successful Category Creation' do 
    it 'creates category' do 
      user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
      user.categories.create(name: 'Shirt')
      Product.create(name: 'Shirt S', price: 234.22, description: 'This is a shirt')
      category = Category.first.products << Product.first
      expect(CategoryProduct.count).to eq(1)
      expect(category.ids).to eq([1])
      expect(CategoryProduct.first.category_id).to eq(1)
      expect(CategoryProduct.first.product_id).to eq(1)
    end

    it 'creates category' do 
      user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
      user.categories.create(name: 'Shirt')
      Product.create(name: 'Shirt S', price: 234.22, description: 'This is a shirt')
      product = Product.first.categories << Category.first
      expect(CategoryProduct.count).to eq(1)
      expect(product.ids).to eq([1])
      expect(CategoryProduct.first.category_id).to eq(1)
      expect(CategoryProduct.first.product_id).to eq(1)
    end
  end

  context 'associations' do
    it { should belong_to(:category) }
    it { should belong_to(:product) }
  end
end
