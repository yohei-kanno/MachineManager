FactoryBot.define do
  factory :user do
    first_name { "菅野" }
    last_name { "洋平" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "foobar" }
    password_confirmation { "foobar" }
    store { :store }
  end
end
