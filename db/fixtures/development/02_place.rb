5.times do |i|
  Place.seed do |p|
    p.name = "階段#{i}"
    p.store_id = Store.first.id
  end
end
