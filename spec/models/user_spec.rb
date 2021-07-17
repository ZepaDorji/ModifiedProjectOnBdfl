require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Successful User Creation' do 
    it 'create a new user' do 
     user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
     expect(User.count).to eq(1)
     expect(user.email).to eq('admin1@gmail.com')
    
    end
  end

  context 'Unsuccessful User Creation' do 
    it 'create a new user' do 
      User.create
      expect(User.count).to eq(0)
     expect(User.first).to eq(nil)
    end
  end
  
  context 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }  
    it { should allow_value('admin1@gmail.com').for(:email) } 
    #it { should allow_value('admin1gmail.com').for(:email) } # Invalid email
  end 
  
  context 'associations' do
    it { should have_many(:categories) }
  end
end