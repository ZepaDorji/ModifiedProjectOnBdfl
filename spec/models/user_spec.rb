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
      User.create # no email and password
      expect(User.count).to eq(0)
     expect(User.first).to eq(nil)
    end
  end
  
  context 'valid password and email' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }  
    it { should allow_value('admin1@gmail.com').for(:email) } 
    #it { should allow_value('admin1gmail.com').for(:email) } # Invalid email
  end
  
  context 'invalid email and password' do
    user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
    it 'should not valid' do
      user.email = "admingmail.com"
      expect(user).to_not be_valid
      user.password = 'admin344'
      expect(user).to_not be_valid
  end
end
  context 'associations' do
    it { should have_many(:categories) }
  end
end