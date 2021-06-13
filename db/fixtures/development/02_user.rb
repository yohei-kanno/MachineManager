User.seed do |u| 
  u.store_id = 1
  u.first_name = "菅野"
  u.last_name = "洋平"
  u.email = "bbb@bbb.bbb"
  u.password = "foobar"
  u.password_confirmation = "foobar"
  u.admin = true
end