require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Successful Category Creation' do 
    it 'create a new user' do 
      user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
      category = user.categories.create(name: 'Shirt')
      expect(Category.count).to eq(1)
      expect(category.name).to eq('Shirt')
    end
  end

  context 'Unsuccessful User Creation' do 
    it 'create a new user' do 
      category = Category.create(name: 'Shirt')
      expect(Category.count).to eq(0)
      expect(Category.first).to eq(nil)
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
    it { should belong_to(:user) }
    it { should have_many(:category_products) }
  end
end