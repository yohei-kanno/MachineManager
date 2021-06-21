require 'rails_helper'
describe "Storeモデル" do
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
    store = build(:store, code: 7777777)
    expect(store).to_not be_valid 
  end
  
  it "店舗コードが９桁以上であれば無効である事" do
    store = build(:store, code: 777777777)
    expect(store).to_not be_valid 
  end
end
