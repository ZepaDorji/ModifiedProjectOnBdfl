require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'Successful Product Creation' do 
    it 'create a new product' do 
      product = Product.create(name: 'T-shirt', price: 132.0, description: 'This s a shirt')
      expect(Product.count).to eq(1)
      expect(product.name).to eq('T-shirt')
      expect(product.price).to eq(132.0)
      expect(product.description).to eq('This s a shirt')
    end
  end

  context 'Unsuccessful User Creation' do 
    it 'create a new user' do 
      expect(Product.count).to eq(0)
      expect(Product.first).to eq(nil)
    end
  end
  
  context 'validations' do
    it { should validate_presence_of(:name) }
    it 'validate' do 
      user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
      category = user.categories.create(name: 'Shirt')
      expect(Category.count).to eq(1)
      expect(category.name.length).to eq(5)
      expect(category.name).to eq('Shirt')
      # expect(category.name).to eq('kssdjsn')
    end
  end 
  
  context 'associations' do
    it { should have_many(:category_products) }
  end
end
