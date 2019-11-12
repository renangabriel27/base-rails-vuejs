FactoryBot.define do
  factory :user do
    sequence(:name) { Faker::Name.name }
    sequence(:email) { |n| "user#{n}@user.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
