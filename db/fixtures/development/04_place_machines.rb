5.times do |t|
  20.times do |i|
    PlaceMachine.seed do |pm|
      pm.machine_id = i + 1 + (t * 20)
      pm.place_id = 1 + t
    end
  end
end

# 20.times do |i|
#   PlaceMachine.seed do |pm|
#     pm.machine_id = i + 20
#     pm.place_id = 2
#   end
# end

# 20.times do |i|
#   PlaceMachine.seed do |pm|
#     pm.machine_id = i + 40
#     pm.place_id = 3
#   end
# end

# 20.times do |i|
#   PlaceMachine.seed do |pm|
#     pm.machine_id = i + 60
#     pm.place_id = 4
#   end
# end

# 20.times do |i|
#   PlaceMachine.seed do |pm|
#     pm.machine_id = i + 80
#     pm.place_id = 5
#   end
# end