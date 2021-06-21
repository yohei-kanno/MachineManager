require 'rails_helper'
describe "Userモデル" do
  before do
    @number_5 = 55555
    @store = create(:store)
  end
  
  it "苗字が無い場合は無効である事" do
    user = build(:user, first_name: nil, store: @store)
    expect(user).to_not be_valid 
  end
  
  it "名前が無い場合は無効である事" do
    user = build(:user, last_name: nil, store: @store)
    expect(user).to_not be_valid 
  end
  
  it "メールアドレスが無い場合は無効である事" do
    user = build(:user, email: nil, store: @store)
    expect(user).to_not be_valid
  end
  
  it "メールアドレスが重複する場合は無効である事" do
    user = create(:user, store: @store)
    other_user = build(:user, email: user.email, store: @store)
    expect(other_user).to_not be_valid
  end
  
  it "パスワードが無い場合は無効である事" do
    user = build(:user, password: nil, store: @store)
    expect(user).to_not be_valid 
  end
  
  it "パスワードが６文字未満なら無効である事" do
    user = build(:user, password: @number_5, store: @store)
    expect(user).to_not be_valid 
  end
end
