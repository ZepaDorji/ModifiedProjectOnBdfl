require 'rails_helper'

RSpec.describe Profile, type: :model do
  context 'user can create their profile' do 
    it 'new user profile' do 
      user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
      #for one to one association we have to user create_modelname for creation action.
      user_profile = user.create_profile(name: 'user1',cid:11505004553,contact_number:16935328,address:'Trashigang')
      expect(user_profile.name).to eq('user1')
    end
  end

  context 'user can delete their profile' do 
    it 'delete user profile' do 
      user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
      user_profile = user.create_profile(name: 'user1',cid:11505004553,contact_number:16935328,address:'Trashigang')
      user_profile.destroy
      expect(Profile.count).to eq(0)
    end
  end

  context 'user can update their profile' do 
    it 'update user profile' do 
      user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
      user_profile = user.create_profile(name: 'user1',cid:11505004553,contact_number:16935328,address:'Trashigang')
     #user_profile.name = "user3"
      user_profile.update(name: 'user2')
      expect(Profile.count).to eq(1)
      expect(user_profile.name).to eq("user2")
      
    end
  end
  context 'associations' do
    it { should belong_to(:user) }
    #it { expect(:profile).to belong_to(:user).dependent(:destroy) }
    t = User.reflect_on_association(:profile)
    it {expect( t.macro).to eq(:has_one)}
  end
end
