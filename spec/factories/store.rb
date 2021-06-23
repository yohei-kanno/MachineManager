FactoryBot.define do
  factory :store do
    name { "千葉" }
    pachinko_num { "333" }
    slot_num { "333" }
    sequence(:code) { |n| 10000000 + n }
  end
end
