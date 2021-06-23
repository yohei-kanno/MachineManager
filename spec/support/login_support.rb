module SomeSupport
  def store_login(store)
    fill_in "店舗名", with: store.name
    fill_in "店舗コード", with: store.code
    click_on "管理者登録画面へ"
  end
  
  def login_as(user)
    visit login_path
    fill_in "店舗コード", with: user.store.code
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: "foobar"
    click_on "ログイン"
  end
end