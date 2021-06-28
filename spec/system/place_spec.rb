require 'rails_helper'

RSpec.describe 'Placeモデル', type: :system do
  describe "倉庫に関して" do
    let(:store){create(:store)}
    let(:admin_user){create(:user, :admin, store: store)}
    let(:machine){create(:machine, store: store)}
    let(:place){create(:place, store: store)}
    
    before do
      login_as(admin_user)
    end
   
    describe "倉庫登録をする前に" do
      context "倉庫が１件も登録されていない場合" do
        it "在庫登録ボタンが表示されていない事" do
          expect(page).to_not have_content("在庫登録")
        end
      end
      
      context "倉庫が登録されている場合" do
        it "在庫登録ボタンが表示されている事" do
          place; visit current_path
          expect(page).to have_content("在庫登録")
        end
      end
    end
    
    describe "登録処理" do
      context "入力が正常である場合" do
        it "倉庫が登録出来る事" do
          click_on "倉庫登録"
          fill_in "保管場所", with: "倉庫2"
          click_on "登録する"
          expect(page).to have_content("登録しました")
          expect(page).to have_selector(".alert-mysuccess")
          expect(Place.count).to eq(1)
        end
      end
      
      context "入力が異常である場合" do
        it "倉庫の登録が出来ない事" do
          click_on "倉庫登録"
          fill_in "保管場所", with: nil
          expect{click_on "登録する"}.to change{Place.count}.by(0)
          expect(page).to have_content("を入力してください")
        end
      end
    end
    
    describe "編集処理" do
      before do
        place
        visit store_places_path(store.id)
      end
      
      context "入力が正常である場合" do
        it "更新が出来る事" do
          click_on "編集", match: :first
          fill_in "保管場所", with: "更新された倉庫"
          click_on "更新する"
          expect(page).to have_content("更新しました")
          expect(page).to have_selector(".alert-mysuccess")
        end
      end
      
      context "異常である場合" do
        it "更新が出来ない事" do
          click_on "編集", match: :first
          fill_in "保管場所", with: nil
          click_on "更新する"
          expect(page).to have_content("を入力してください")
        end
      end
    end
    
    describe "削除処理" do
      context "倉庫に機械が存在する場合" do
        it "削除出来ない事" do
          PlaceMachine.create(machine_id: machine.id, place_id: place.id)
          visit store_places_path(store.id)
          page.accept_confirm do
            click_on "削除"
          end
          expect(page).to have_content("台情報がある為削除出来ません")
          expect(page).to have_selector(".alert-mydanger")
          expect(Place.count).to eq(1)
        end
      end
      
      context "倉庫に機械が存在しない場合" do
       it "削除出来る事" do
          place
          visit store_places_path(store.id)
          page.accept_confirm do
            click_on "削除"
          end
          expect(page).to have_content("削除しました")
          expect(page).to have_selector(".alert-mysuccess")
          expect(Place.count).to eq(0)
        end
      end
    end
  end
end
