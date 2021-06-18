100.times do |i|
  PlaceMachine.seed do |pm|
    pm.machine_id = i + 1
    pm.place_id = 1
  end
end