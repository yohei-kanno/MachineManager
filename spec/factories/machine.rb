FactoryBot.define do
  factory :machine do
    sequence(:name) { |n| "スーパー海物語IN地中海#{n}" }
    sequence(:maker) { |n| "株式会社 三洋販売#{n}" }
    sequence(:remarks) { |n| "#{n}月#{n}日下取り" }
    place{ "倉庫" }
    front_number { "sy-g 010234" }
    flame_number { "sy-g 010234" }
    board_number { "sy-g 010234" }
    association :store
  end
  
  # 認定取得済みのパチンコ
  trait :pachinko_acquired do
    form_type { :pachinko }
    certification { :acquired }
  end
  
  # 認定未取得のパチンコ備考なし未完全体枠
  trait :pachinko_unacquired do
    form_type { :pachinko }
    certification { :unacquired }
    machine_status { :unperfect }
    parts_status { :flame }
    front_number { "" }
    flame_number { "" }
    board_number { "" }
  end
  
  # 認定取得済みスロット
  trait :slot_acquired do
    form_type { :slot }
    certification { :acquired }
  end
  
  #認定未取得のスロット備考なし未完全体
  trait :slot_unacquired do
    form_type { :slot}
    certification { :unacquired }
    machine_status { :unperfect }
  end
end
