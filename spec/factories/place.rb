FactoryBot.define do
  factory :place do
    sequence(:name) { |n| "倉庫#{n}" }
    association :store
  end
end