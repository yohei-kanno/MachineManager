require 'rails_helper'
describe "Userモデル" do
  context "入力が正常である場合" do
    it "全て入力されていれば有効である事" do
      user = build(:user)
      expect(user).to be_valid
    end
  end
  
  context "入力が異常である場合" do
    it "苗字が無い場合は無効である事" do
      user = build(:user, first_name: nil)
      expect(user).to_not be_valid 
    end
    
    it "名前が無い場合は無効である事" do
      user = build(:user, last_name: nil)
      expect(user).to_not be_valid 
    end
    
    it "メールアドレスが無い場合は無効である事" do
      user = build(:user, email: nil)
      expect(user).to_not be_valid
    end
    
    it "メールアドレスが重複する場合は無効である事" do
      user = create(:user)
      other_user = build(:user, email: user.email)
      expect(other_user).to_not be_valid
    end
    
    it "パスワードが無い場合は無効である事" do
      user = build(:user, password: nil)
      expect(user).to_not be_valid 
    end
    
    it "パスワードが６文字未満なら無効である事" do
      user = build(:user, password: "a" * 5)
      expect(user).to_not be_valid 
    end
  end
end
