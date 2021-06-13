100.times do |i|
  Machine.seed do |m|
    m.store_id = 1
    m.maker = "株式会社 三洋物産"
    m.form_type = rand(0..1)
    m.name = "Pスーパー海物語IN地中海SAF"
    m.machine_status = rand(0..1)
    m.parts_status = rand(0..2)
    m.place = rand(0..4)
    m.certification = rand(0..1)
    m.remarks = "#{i}日後の下取り予定"
    m.front_number = "SY-A #{i}"
    m.flame_number = "SY-A #{i}"
    m.board_number = "SY-A #{i}"
  end
end
