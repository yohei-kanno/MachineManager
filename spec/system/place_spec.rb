require 'rails_helper'

RSpec.describe 'Placeモデル', type: :system do
  describe "場所に関して" do
    let(:store){create(:store)}
    let(:admin_user){create(:user, :admin, store: store)}
    let(:machine){create(:machine, store: store)}
    let(:place){create(:place, store: store)}
    
    before do
      login_as(admin_user)
    end
   
    describe "場所登録をする前に" do
      context "場所が１件も登録されていない場合" do
        it "在庫登録ボタンが表示されていない事" do
          expect(page).to_not have_content("在庫登録")
        end
      end
      
      context "場所が登録されている場合" do
        it "在庫登録ボタンが表示されている事" do
          place; visit current_path
          expect(page).to have_content("在庫登録")
        end
      end
    end
    
    describe "登録処理" do
      context "入力が正常である場合" do
        it "場所が登録出来る事" do
          click_on "場所登録"
          fill_in "保管場所の名前", with: "倉庫2"
          expect{click_on "登録する"}.to change{Place.count}.by(1)
          expect(page).to have_content("登録が完了しました")
          expect(page).to have_selector(".alert-mysuccess")
        end
      end
      
      context "入力が異常である場合" do
        it "場所の登録が出来ない事" do
          click_on "場所登録"
          fill_in "保管場所の名前", with: nil
          expect{click_on "登録する"}.to change{Place.count}.by(0)
          expect(page).to have_content("入力内容に不備があり登録出来ませんでした")
          expect(page).to have_selector(".alert-mydanger")
        end
      end
    end
  end
end
