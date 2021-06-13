store = Store.create(
   name: "千葉",
   pachinko_num: 111,
   slot_num: 111,
   code: 11111111
)

User.create(
  store: store,
  first_name: "菅野",
  last_name: "洋平",
  email: "aaa@aaa.aaa",
  password: "foobar",
  password_confirmation: "foobar",
  admin: true,
)

100.times do |i|
  Machine.create(
    store: store,
    maker: "株式会社 三洋物産",
    form_type: rand(0..1),
    name: "Pスーパー海物語IN地中海SAF",
    machine_status: rand(0..1),
    parts_status: rand(0..2),
    place: rand(0..4),
    certification: rand(0..1),
    remarks: "#{i}日後の下取り予定",
    front_number: "SY-A #{i}",
    flame_number: "SY-A #{i}",
    board_number: "SY-A #{i}"
  )
end