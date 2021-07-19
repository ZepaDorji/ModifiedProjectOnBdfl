require 'rails_helper'

RSpec.describe CategoryPolicy, type: :policy do
  user  = User.new(email: 'admin@gmail.com', password: 'password')

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
    it "cannot create destroy category is user is not an admin" do
      expect(subject).not_to permit(User.new(admin:false ), Category.new())
    end

    it "can destroy category if user is an admin" do
      expect(subject).to permit(User.new(admin: true), Category.new())
    end

  end
end
