# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    email { "test2@example.com" }
    password { "test123" }
  end
end
