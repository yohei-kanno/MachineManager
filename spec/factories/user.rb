FactoryBot.define do
  factory :user do
    first_name { "菅野" }
    last_name { "洋平" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "foobar" }
    password_confirmation { "foobar" }
    association :store
    after(:create, &:activate!)
  end
  
  trait :general do
    admin { :general }
  end
  
  trait :admin do
    admin { :admin}
  end
end
