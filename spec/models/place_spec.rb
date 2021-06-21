require 'rails_helper'
describe "Placeモデル" do
  before do
    @store = create(:store)
  end
  
  it "名前が無い場合は無効である事" do
    place = build(:place, name: nil, store: @store)
    expect(place).to_not be_valid 
  end
end
