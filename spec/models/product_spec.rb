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
  
  context 'validations'do 
  
    it 'product name should have minimum of 4 length' do 
      product = Product.create(name: 'T-shirt', price: 132.0, description: 'This s a shirt')
      expect(product).to be_valid
      product.name = 'asd' 
      expect(product).to_not be_valid

     end
  
    it 'product description should length in between 5 to 100'do
    product = Product.create(name: 'T-shirt', price: 132.0, description: 'This s a shirt')
    expect(product).to be_valid
    product.description = 'asd'
    expect(product).to_not be_valid
     
    end
    it "description should type text"do 
    product = Product.create(name: 'T-shirt', price: 132.0, description: 'This s a shirt')
    expect(product.description).to be_a(String)
    product.description = 1245
    expect(product).to_not be_valid

    end 
  end


  
  context 'associations' do
    it { should have_many(:category_products) }
  end
end
