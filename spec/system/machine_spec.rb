require 'rails_helper'

RSpec.describe 'Machineモデル', type: :system do
  describe "機械台に関して" do
    let(:store){create(:store)}
    let!(:place){create(:place, store: store)}
    let(:admin_user){create(:user, :admin, store: store)}
    
    let(:machine_1){create(:machine, store: store)} 
    let(:machine_2){create(:machine, :pachinko_unacquired,store: store)}
    let(:machine_3){create(:machine, :slot_acquired, store: store)}
    let(:machine_4){create(:machine, :slot_unacquired, store: store)}
    
    before do
      login_as(admin_user)
      machine_1
      machine_2
      machine_3
      machine_4
      visit current_path
      # 要素が４つある状態の一覧画面に遷移している
    end
    
    describe "機械台の登録" do
      let(:machine){build(:machine, :pachinko_acquired)}
      context "入力が十分である場合" do
        it "機械台の登録が行える事" do
          click_on "在庫登録"
          fill_in "メーカー", with: machine.maker
          fill_in "形式名", with: machine.name
          click_on "登録する"
          expect(page).to have_content(machine.name)
          expect(page).to have_content(machine.maker)
          expect(page).to have_content("登録しました")
          expect(page).to have_selector(".alert-mysuccess")
        end
      end
      
      context "入力が不十分である場合" do
        it "機械台の登録が行えない事" do
          click_on "在庫登録"
          click_on "登録する"
          expect(page).to have_content("を入力してください")
        end
      end
    end
    
    describe "機械台一覧" do
      context "一覧表示" do
        it "表示されている" do
          machines = [machine_1, machine_2, machine_3, machine_4]
          machines.each do |machine|
            expect(page).to have_content(machine.name)
            expect(page).to have_content(machine.maker)
            expect(page).to have_content(machine.form_type_i18n)
          end
        end
      end
        
      context "番号に関して" do
        it "番号が登録されている場合番号が表示されている事" do
          click_on "番号",match: :first
          expect(page).to have_content(machine_1.flame_number)
          expect(page).to have_content(machine_1.front_number)
          expect(page).to have_content(machine_1.board_number)
        end
        
        it "番号が登録されていない場合その旨表示されている事" do
          all('tbody tr')[1].click_on "番号"
          expect(page).to have_content("登録されていません")
        end
      end
      
      context "検索機能に関して" do
        let(:machines){[machine_2, machine_3, machine_4]}
        before do
          click_on "検索する"
        end
        
        it "メーカーで検索出来る事" do
          fill_in "メーカー", with: machine_1.maker
          click_on "検索"
          expect(page).to have_content(machine_1.maker)
          machines.each do |machine|
            expect(page).to_not have_content(machine.maker)
          end
        end
          
        it "形式で検索出来る事" do
          select "パチンコ", from: "形式" 
          click_on "検索"
          expect(page).to have_content("パチンコ")
          expect(page).to_not have_content("スロット")
        end
        
        it "形式名で検索出来る事" do
          fill_in "形式名", with: machine_1.name
          click_on "検索"
          expect(page).to have_content(machine_1.name)
          machines.each do |machine|
            expect(page).to_not have_content(machine.name)
          end
        end
        
        it "状態①で検索出来る事" do
          select "完全体", from: "状態①" 
          click_on "検索"
          expect(page).to have_content("完全体")
          expect(page).to_not have_content("未完全体")
        end
        
        it "状態②で検索出来る事" do
          select "本体", from: "状態②" 
          click_on "検索"
          expect(page).to have_content("本体")
          expect(page).to_not have_content("セル")
          expect(page).to_not have_content("枠")
        end
        
        it "認定取得の有無で検索出来る事" do
          select "取得済", from: "認定" 
          click_on "検索"
          expect(page).to have_content("取得済")
          expect(page).to_not have_content("未取得")
        end
        
        it "備考で検索出来る事" do
          fill_in "備考", with: machine_1.remarks
          click_on "検索"
          expect(page).to have_content(machine_1.remarks)
          machines.each do |machine|
            expect(page).to_not have_content(machine.remarks)
          end
        end
      end
    end
    
    describe "機械台編集機能" do
      context "入力が正常な場合" do
        it "編集が出来る事" do
          click_on "編集", match: :first
          fill_in "メーカー", with: "株式会社 京楽産業"
          click_on "更新する"
          expect(page).to have_content("更新しました")
          expect(page).to have_content("株式会社 京楽産業")
          expect(page).to have_selector(".alert-mysuccess")
        end
      end
      
      context "入力が異常な場合" do
        it "入力が異常だと編集が出来ない事" do
          click_on "編集", match: :first
          fill_in "メーカー", with: nil
          click_on "更新する"
          expect(page).to have_content("を入力してください")
        end
      end
    end
      
    describe "機械台削除機能" do
      context "ダイアログでYESを選択した場合" do
        it "削除出来る事" do
          page.accept_confirm do
            click_on "削除", match: :first
          end
          sleep 1 
          expect(page).to have_content("削除しました")    
          expect(Machine.count).to eq(3)
        end
      end
        
      context "ダイアログでNoを選択した場合" do
        it "削除されない事" do
          page.dismiss_confirm do
            click_on "削除", match: :first
          end
          expect(page).to have_content(machine_1.name)
          expect(page).to have_content(machine_1.maker)
          expect(page).to have_content(machine_1.form_type_i18n)  
          expect(Machine.count).to eq(4)
        end
      end
    end
  end
end
