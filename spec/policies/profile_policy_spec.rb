require 'rails_helper'

RSpec.describe ProfilePolicy, type: :policy do
  let(:user) { User.new }

  subject { described_class }

  permissions :create? do
    user1  = User.new(email: 'admin@gmail.com', password: 'password',admin:false)
    it "cannot create profile if user is not admin" do
      expect(subject).not_to permit(user1, Profile.new())
    end

    it "can create category if user is an admin" do
      expect(subject).to permit(User.new(admin:true),Profile.new())
      
    end
  end

  permissions :destroy? do
    user  = User.create(email: 'current_user@gmail.com', password: 'password', admin:false)
    profile = user.create_profile(name: Faker::Name.name, 
                            cid: Faker::IDNumber.valid,
                            contact_number: Faker::Number.number(digits: 8),
                            address: Faker::Address.city
                            ) 
    it "cannot delete profile if user is not an admin" do
      expect(subject).not_to permit(user, profile)
    end

    it "can delete profile if user is an admin" do
      expect(subject).to permit(User.new(admin: true),Profile.new())
    end
    
  end
end
