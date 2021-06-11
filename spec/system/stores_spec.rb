require 'rails_helper'

RSpec.describe 'Stores', type: :system do
  before do
    @store = Store.create
  end
  
  it "画面遷移出来ていること" do
    visit new_store_path
  end
end