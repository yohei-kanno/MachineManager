require 'rails_helper'

RSpec.describe 'Sessions', type: :system do
  describe "ログイン,ログアウト" do
    let(:user){create(:user, :admin)}
    context "入力内容が正常である場合" do
      it "ログイン出来る事" do
        login_as(user)
        expect(page).to have_content("ログインしました")
        expect(page).to have_selector(".alert-mysuccess")
      end
    end   
    
    context "入力に不備がある場合" do
      it "ログイン出来ない事" do
        visit login_path
        click_on "ログイン"
        expect(page).to have_content("ログイン出来ませんでした")
        expect(page).to have_selector(".alert-mydanger")
      end
    end
    
    context "ログアウト" do
      it "出来る事" do
        login_as(user)
        expect(page).to have_link("ログアウト")
        click_on "ログアウト"
        expect(page).to have_content("ログアウトしました")
        expect(page).to have_selector(".alert-mysuccess")
      end
    end
  end
end
