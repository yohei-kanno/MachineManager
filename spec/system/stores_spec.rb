require 'rails_helper'

RSpec.describe 'Storeモデル', type: :system do
  describe "店舗登録" do
    context "入力が正常な場合" do
      
      before do
        visit new_store_path
        fill_in "店舗名", with: "千葉店"
        fill_in "パチンコ台数", with: 111
        fill_in "スロット台数", with: 111
        fill_in "店舗コード", with: 11111111
        page.check("store_agreement")
        click_button "登録する"
      end
      
      it "管理者登録画面に遷移している事" do
        expect(page).to have_content("管理者ユーザー作成画面")
      end
      
      it "Storeモデルが作成されている事" do
        expect(Store.count).to eq(1)
      end
      
      it "登録完了のフラッシュメッセージが表示されること" do
        expect(page).to have_content("登録しました")
        expect(page).to have_selector(".alert-mysuccess")
      end
    end
    
    
    context "入力に不備がある場合" do
      
      before do
        visit new_store_path
        click_button "登録する"
      end
      
      it "ページ遷移していない事" do
        expect(page).to have_content("店舗登録")  
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
    let(:store){create(:store)}
    let(:admin_user){create(:user, :admin, store: store)}
    
    before do
      login_as(admin_user)
      visit edit_store_path(store.id)
    end
    
    it "店舗編集画面に遷移している事" do
      expect(page).to have_content("店舗編集")
    end
    
    context "入力が正常な場合" do
      it "編集出来る事" do
        fill_in "店舗名", with: "茨城"
        click_on "更新する"
        expect(page).to have_content("茨城")
        expect(page).to have_content("更新しました")
        expect(page).to have_selector('.alert-mysuccess')
      end
    end
      
      
    context "入力に不備がある場合" do
      it "更新出来ない事" do
        fill_in "店舗名", with: nil
        click_on "更新する"
        expect(page).to have_content("更新出来ませんでした")
        expect(page).to have_selector(".alert-mydanger")
      end
    end
  end
end
