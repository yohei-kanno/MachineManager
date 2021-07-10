require 'rails_helper'

RSpec.describe 'Storeモデル', type: :system do
  describe "店舗登録" do
    context "入力が正常な場合" do
      
      before do
        visit new_store_path
        fill_in "店舗名", with: "千葉店"
        fill_in "パチンコの設置台数", with: 111
        fill_in "スロットの設置台数", with: 111
        fill_in "店舗コード", with: 11111111
        fill_in "名字", with: "菅野"
        fill_in "名前", with: "洋平"
        fill_in "メールアドレス", with: "test@example.com"
        fill_in "パスワード", with: "foobar"
        fill_in "パスワード(確認)", with: "foobar"
        page.check("store_users_agreement")
        click_button "登録する"
      end
      
      it "Storeモデルが作成されている事" do
        expect(Store.count).to eq(1)
      end
      
      it "登録完了のフラッシュメッセージが表示されること" do
        expect(page).to have_selector(".alert-mysuccess")
      end
    end
    
    
    context "入力に不備がある場合" do
      
      before do
        visit new_store_path
        click_button "登録する"
      end
      
      it "Storeモデルが作成されていない事" do
        expect(Store.count).to eq(0)  
      end
      
      it "登録出来ていない旨のフラッシュメッセージが表示されている事" do
        expect(page).to have_content("登録出来ませんでした")
        expect(page).to have_selector(".alert-mydanger")
      end
    end
  end
  
  describe "店舗編集" do
    let(:store) { create(:store) }
    let(:admin_user) { create(:user, :admin, store: store) }
    
    before do
      login_as(admin_user)
      visit machines_path
    end
    
    context "入力が正常な場合" do
      it "編集出来る事" do
        click_on "店舗編集"
        fill_in "店舗名", with: "茨城"
        click_on "更新する"
        expect(page).to have_content("茨城")
        expect(page).to have_content("更新しました")
        expect(page).to have_selector('.alert-mysuccess')
      end
    end
      
      
    context "入力に不備がある場合" do
      it "更新出来ない事" do
        click_on "店舗編集"
        fill_in "店舗名", with: nil
        click_on "更新する"
        expect(page).to have_content("を入力してください")
      end
    end
  end
end
