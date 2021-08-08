require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Successful Category Creation' do 
    it 'create a new category' do 
      user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
      category = user.categories.create(name: 'Shirt')
      expect(Category.count).to eq(1)
      expect(category.name).to eq('Shirt')
    end
  end

  context 'Unsuccessful User Creation' do 
    it 'create a new category' do 
      category = Category.create(name: 'Shirt')   # no user
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
      
    end

    it { should validate_presence_of(:name) }
    it 'validate' do 
      user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
      category = user.categories.create(name: '')
      expect(category).to_not be_valid
      expect(Category.count).to eq(0)
      category = user.categories.create(name: 's')
      expect(Category.count).to eq(0)
      expect(category).to_not be_valid
      category = user.categories.create(name: 'sajllfksdjfl')
      expect(category).to be_valid
      expect(Category.count).to eq(1)
    end
  end 

  
  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:category_products) }
  end
end