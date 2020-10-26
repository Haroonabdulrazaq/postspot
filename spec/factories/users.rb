FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    password { Faker::Internet.password }
  end
end
