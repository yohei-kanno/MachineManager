require 'rails_helper'
describe "Machineモデル" do
  context "入力が正常である場合" do
    it "全て入力されていれば有効である事" do
      machine = build(:machine)
      expect(machine).to be_valid
    end
  end
    
  context "入力が異常である場合" do
    it "メーカー名が無い場合は無効である事" do
      machine = build(:machine, :pachinko_unacquired, maker: nil)
      expect(machine).to_not be_valid
    end
    
    it "形式が無い場合は無効である事" do
      machine = build(:machine, form_type: nil)
      expect(machine).to_not be_valid
    end
    
    it "機種名が無い場合は無効である事" do
      machine = build(:machine, name: nil)
      expect(machine).to_not be_valid
    end
    
    it "台の状態が選択されていない場合は無効である事" do
      machine = build(:machine, machine_status: nil)
      expect(machine).to_not be_valid
    end
    
    it "台の部品の状態が無い場合は無効である事" do
      machine = build(:machine, parts_status: nil)
      expect(machine).to_not be_valid
    end
    
    it "場所が設定されていない場合無効である事" do
      machine = build(:machine, place: nil )
      expect(machine).to_not be_valid
    end
    
    it "認定が設定されていない場合無効である事" do
      machine = build(:machine, certification: nil )
      expect(machine).to_not be_valid
    end
  end
end
