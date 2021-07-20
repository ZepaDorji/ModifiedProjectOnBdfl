require 'rails_helper'

RSpec.describe Profile do
    
        it 'creates profile' do
            user = User.create(email: 'admin1@gmail.com', password: 'admin@1234', admin: true)
            params = {
                profile: {  name: Faker::Name.name, 
                            cid: Faker::IDNumber.valid,
                            contact_number: Faker::Number.number(digits: 8),
                            address: Faker::Address.city,
                            id: user.id
                        }
                     } 
            post api_v1_shop_profiles_path, params: params
            expect(status).to eq(200)
            expect(Profile.count).to eq(1)
        end

        it 'list all user profile' do
            user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
            params = {
                profile: {  name: Faker::Name.name, 
                            cid: Faker::IDNumber.valid,
                            contact_number: Faker::Number.number(digits: 8),
                            address: Faker::Address.city,
                            id: user.id
                        }
                     } 
            post api_v1_shop_profiles_path, params: params
            # post api_v1_shop_profiles_path, params: params   one user will have one profile only
            # post api_v1_shop_profiles_path, params: params
            # post api_v1_shop_profiles_path, params: params

            get api_v1_shop_profiles_path
            expect(status).to eq(200)
            expect(Profile.count).to eq(1)
        end

        it 'update user profile' do
            user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
            params = {
                profile: {  name: Faker::Name.name, 
                            cid: Faker::IDNumber.valid,
                            contact_number: Faker::Number.number(digits: 8),
                            address: Faker::Address.city,
                            id: user.id
                        }
                     } 
            post api_v1_shop_profiles_path, params: params

            put api_v1_shop_profile_path(Profile.first.id), params:{ profile: { name: 'user1', id: user.id } }
            expect(status).to eq(200)
            expect(Profile.first.name).to eq('user1')
        end

        it 'delete user profile' do
            user = User.create(email: 'admin1@gmail.com', password: 'admin@1234')
            params = {
                profile: {  name: Faker::Name.name, 
                            cid: Faker::IDNumber.valid,
                            contact_number: Faker::Number.number(digits: 8),
                            address: Faker::Address.city,
                            id: user.id
                        }
                     } 
            post api_v1_shop_profiles_path, params: params

            delete api_v1_shop_profile_path(user), params:{ user: {id: user.id } }
            expect(status).to eq(200)
            expect(Profile.count).to eq(0)
        end


end
