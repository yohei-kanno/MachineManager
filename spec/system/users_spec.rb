require 'rails_helper'

RSpec.describe 'ユーザーモデル', type: :system do
  describe "管理者登録" do
    let(:store){create(:store)}
    let(:user){build(:user, :admin)}
    context "入力が正常な場合" do
      
      it "ユーザー登録が出来ている事" do
        visit back_stores_path
        expect(page).to have_content("店舗ログイン")
        store_login(store)
        expect(page).to have_content("管理者作成画面")
        fill_in "名字", with: user.first_name
        fill_in "名前", with: user.last_name
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: user.password
        fill_in "パスワード(確認)", with: user.password
        click_on "登録する"
        expect(page).to have_content("登録が完了しました")
      end
    end
    
    
    context "入力に不備がある場合" do
      it "ユーザー登録が出来ない事" do
        visit back_stores_path
        expect(page).to have_content("店舗ログイン")
        store_login(store)
        expect(page).to have_content("管理者作成画面")
        click_on "登録する"
        expect(page).to have_content("登録出来ませんでした")
        expect(page).to have_selector(".alert-mydanger")
      end
    end
    
    context "既に管理者がいる場合" do
      let!(:user){create(:user, :admin)}
      it "管理者画面に画面遷移が出来ない事" do
        visit back_stores_path
        expect(page).to have_content("店舗ログイン")
        fill_in "店舗名", with: user.store.name
        fill_in "店舗コード", with: user.store.code
        click_on "管理者登録画面へ"
        expect(page).to have_selector(".alert-mydanger")
        expect(page).to have_content("該当の店舗は存在しないか管理者が既に登録されています")
      end
    end
  end
end
