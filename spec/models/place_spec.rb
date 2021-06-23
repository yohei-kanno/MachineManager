require 'rails_helper'
describe "Placeモデル" do
  context "入力が正常である場合" do
    it "全てが入力されていれば有効である事" do
      place = build(:place)
      expect(place).to be_valid
    end
  end
    
  context "入力が異常である場合" do
    it "名前が無い場合は無効である事" do
      place = build(:place, name: nil)
      expect(place).to_not be_valid 
    end
  end
end
