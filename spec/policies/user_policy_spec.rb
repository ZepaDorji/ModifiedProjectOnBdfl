require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  #let(:user) { User.new }

  subject { described_class }


  permissions :create? do
      it "user cannot add  another users" do
        expect(subject).not_to permit(User.new(admin:false ), User.new())
      end
  
      it "admin can add user" do
        expect(subject).to permit(User.new(admin: true), User.new())
      end
  end

  permissions :update? do 
    user = User.new(email: 'dorji@gmail.com',password: "password")
    it "admin can update users credential" do 
      expect(subject).to permit(User.new(admin:true),user.email = 'admin@gmail.com')
    end

    it "user cannot update his/her own credential" do 
      expect(subject).not_to permit(User.new(admin:false),user.email = 'user@gmail.com')
    end
  end

  permissions :destroy? do
    user = User.new(email: 'dorji@gmail.com',password: "password")
    it "admin can delete users credential" do 
      expect(subject).to permit(User.new(admin:true),user)
    end

    it "user cannot delete his/her own credential" do 
      expect(subject).not_to permit(User.new(admin:false),user)
    end
  end
end
