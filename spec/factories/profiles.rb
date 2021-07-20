FactoryBot.define do
  factory :profile do
    name { "MyString" }
    cid { 1 }
    contact_number { 1 }
    address { "MyText" }
    user { nil }
  end
end
