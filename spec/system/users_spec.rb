require 'rails_helper'

RSpec.describe 'ユーザーモデル', type: :system do
  describe "ユーザーに関するテスト" do
    let(:store){create(:store)}
    let(:admin_user){build(:user, :admin, store: store)}
    let(:general_user){build(:user, :general, store: store)}
  
    describe "一般ユーザー登録" do
      let(:admin_user){create(:user, :admin, store: store)}
      let(:general_user){create(:user, :general, store: store)}
      context "管理者で操作する場合" do
        before do
          login_as(admin_user)
          general_user
        end
        
        it "メニューにユーザー一覧、作成が表示される事" do
          expect(page).to have_link("ユーザー作成")
          expect(page).to have_link("ユーザー一覧")
        end
        
        it "内容が正常であればユーザー登録が出来る事" do
          visit new_user_path
          fill_in "名字", with: "菅野"
          fill_in "名前", with: "洋平"
          fill_in "メールアドレス", with: "test1a1@example.com"
          fill_in "パスワード", with: "a" * 6
          fill_in "パスワード(確認)", with: "a" * 6
          expect{click_on "登録する"}.to change{User.count}.by(1)
          expect(page).to have_selector(".alert-mysuccess")
        end
        
        it  "内容に不備があれば登録出来ない事" do
          visit new_user_path
          expect{click_on "登録"}.to change{User.count}.by(0)
          expect(page).to have_content("登録出来ませんでした")
          expect(page).to have_selector(".alert-mydanger")
        end
        
        it "権限を付与出来て剥奪出来る事出来る事" do
          visit users_path
          page.accept_confirm do
            all('tbody tr')[1].click_on "権限付与"
          end
          expect(page).to have_content("管理者権限を付与しました")
          expect(User.second.admin).to eq("admin")
          
          page.accept_confirm do
            all('tbody tr')[1].click_on "権限剥奪"
          end
          expect(page).to have_content("管理者権限を剥奪しました")
          expect(User.second.admin).to eq("general")
        end
        
        it "内容が正常であれば編集出来る事" do
          visit users_path
          click_on "編集する", match: :first
          fill_in "名字", with: "更新された名前"
          click_on "更新する"
          expect(page).to have_content("更新しました")
          expect(page).to have_selector(".alert-mysuccess")
          expect(page).to have_content("更新された名前")
        end
        
        it "内容に不備があれば更新出来ない事" do
          visit users_path
          click_on "編集する", match: :first
          fill_in "名字", with: nil
          click_on "更新する"
          expect(page).to have_content("を入力してください")
        end
        
        it "削除出来る事" do
          visit users_path
          page.accept_confirm do
            all('tbody tr')[1].click_on "削除する"
          end
          expect(page).to have_content("削除しました")
          expect(User.count).to eq(1)
        end
      end
        
      context "一般ユーザーで操作する場合" do
        before do
          login_as(general_user)
        end
        
        it "ユーザー一覧画面に行くとリダイレクト" do
          visit users_path
          expect(page).to have_selector(".alert-mydanger")
          expect(page).to have_content("権限がありません")
        end
        
        it "ユーザー作成画面に行くとリダイレクト" do
          visit new_user_path
          expect(page).to have_selector(".alert-mydanger")
          expect(page).to have_content("権限がありません")
        end
      end
    end
  end
end
