store = Store.create(
  name: "千葉",
  pachinko_num: 111,
  slot_num: 111,
  code: 11111111
)

5.times do |i|
  Place.create(
    name: "階段#{i}",
    store_id: Store.first.id
  )
end

5.times do |t|
  20.times do |i|
    Machine.create(
      store_id: Store.first.id,
      maker: "株式会社 三洋物産",
      form_type: rand(0..1),
      name: "Pスーパー海物語IN地中海SAF",
      place: Place.all[t].name,
      machine_status: rand(0..1),
      parts_status: rand(0..2),
      certification: rand(0..1),
      remarks: "#{ i + 1 + (t * 20) }日後の下取り予定",
      front_number: "SY-A #{ i + 1 + (t * 20) }",
      flame_number: "SY-A #{ i + 1 + (t * 20) }",
      board_number: "SY-A #{ i + 1 + (t * 20) }",
    )
  end
end

5.times do |t|
  20.times do |i|
    PlaceMachine.create(
      machine_id: i + 1 + (t * 20),
      place_id: 1 + t
    )
  end
end

User.create(
  first_name: "菅野",
  last_name: "洋平",
  email: "aaa@aaa.aaa",
  password: "foobar",
  password_confirmation: "foobar",
  admin: true,
  store: store
)