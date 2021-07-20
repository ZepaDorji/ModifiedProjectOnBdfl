require 'rails_helper'

RSpec.describe CategoryPolicy, type: :policy do
  user  = User.new(email: 'admin@gmail.com', password: 'password')
  category = user.categories.new(name:'football')

  subject { described_class }


  permissions :create? do
    it "cannot create category if user is not an admin" do
      expect(subject).not_to permit(User.new(admin:false ), Category.new())
    end

    it "can create category if user is an admin" do
      expect(subject).to permit(User.new(admin: true), Category.new())
    end

  end
  permissions :destroy? do
    it "cannot destroy category if the user is not an admin" do
      expect(subject).not_to permit(User.new(admin:false ), category)
    end

    it "can destroy category if the user is an admin" do
      expect(subject).to permit(User.new(admin: true), category)
    end

  end

  permissions :update? do 
    it "admin can update category" do 
      expect(subject).to permit(User.new(admin:true),category.name = 'Programming')
    end

    it "user cannot update category" do 
      expect(subject).not_to permit(User.new(admin:false),category.name = 'Programming')
    end
  end
end
