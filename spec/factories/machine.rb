FactoryBot.define do
  factory :machine do
    maker { "株式会社 三洋販売" }
    name { "スーパー海物語IN地中海" }
    front_number { "sy-g 010234" }
    flame_number { "sy-g 010234" }
    board_number { "sy-g 010234" }
    store { :store }
  end
end
