5.times do |t|
  20.times do |i|
    PlaceMachine.seed do |pm|
      pm.machine_id = i + 1 + (t * 20)
      pm.place_id = 1 + t
    end
  end
end
