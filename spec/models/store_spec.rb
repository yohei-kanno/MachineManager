require 'rails_helper'
describe "Storeモデル" do
  context "入力が正常である場合" do
    it "全て入力されていれば有効である事" do
      store = build(:store)
      expect(store).to be_valid
    end
  end
    
  context "入力が異常である場合" do
    it "店舗名が無い場合は無効である事" do
      store = build(:store, name: nil)
      expect(store).to_not be_valid 
    end
    
    it "パチンコの台数が無い場合は無効である事" do
      store = build(:store, pachinko_num: nil)
      expect(store).to_not be_valid 
    end
    
    it "スロットの台数が無い場合は無効である事" do
      store = build(:store, slot_num: nil)
      expect(store).to_not be_valid 
    end
    
    it "店舗コードが無い場合は無効である事" do
      store = build(:store, name: nil)
      expect(store).to_not be_valid 
    end
    
    it "店舗コードが重複している場合は無効である事" do
      store = create(:store)
      other_store = build(:store, code: store.code)
      expect(other_store).to_not be_valid 
    end
    
    it "店舗コードが８桁未満であれば無効である事" do
      store = build(:store, code: ( "1" * 7 ).to_i)
      expect(store).to_not be_valid 
    end
    
    it "店舗コードが９桁以上であれば無効である事" do
      store = build(:store, code: ( "1" * 9 ).to_i)
      expect(store).to_not be_valid 
    end
  end
end
