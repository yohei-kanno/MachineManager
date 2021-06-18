User.seed do |u| 
  u.store_id = Store.first.id
  u.first_name = "菅野"
  u.last_name = "洋平"
  u.email = "bbb@bbb.bbb"
  u.password = "foobar"
  u.password_confirmation = "foobar"
  u.admin = true
end