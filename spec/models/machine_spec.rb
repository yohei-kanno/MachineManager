require 'rails_helper'
describe "Machineモデル" do
  
  before do
    @store = create(:store)
  end
  
  it "店舗名が無い場合は無効である事" do
    machine = build(:machine, maker: nil,store: @store)
    expect(machine).to_not be_valid
  end
  
  it "形式が無い場合は無効である事" do
    machine = build(:machine, form_type: nil,store: @store)
    expect(machine).to_not be_valid
  end
  
  it "機種名が無い場合は無効である事" do
    machine = build(:machine, name: nil,store: @store)
    expect(machine).to_not be_valid
  end
  
  it "台の状態が選択されていない場合は無効である事" do
    machine = build(:machine, machine_status: nil,store: @store)
    expect(machine).to_not be_valid
  end
  
  it "台の部品の状態が無い場合は無効である事" do
    machine = build(:machine, parts_status: nil,store: @store)
    expect(machine).to_not be_valid
  end
  
  it "場所が設定されていない場合無効である事" do
    machine = build(:machine, place: nil ,store: @store)
    expect(machine).to_not be_valid
  end
  
  it "認定が設定されていない場合無効である事" do
    machine = build(:machine, certification: nil ,store: @store)
    expect(machine).to_not be_valid
  end
  
  it "セル番号がない場合無効である事" do
    machine = build(:machine, front_number: nil ,store: @store)
    expect(machine).to_not be_valid
  end
  
  it "セル番号が重複している場合無効である事" do
    machine = create(:machine, store: @store)
    other_machine = build(:machine, store: @store, front_number: machine.front_number)
    expect(other_machine).to_not be_valid
  end
  
  it "筐体番号及び枠番号がない場合無効である事" do
    machine = build(:machine, flame_number: nil ,store: @store)
    expect(machine).to_not be_valid
  end
  
  it "筐体番号及び枠番号が重複している場合無効である事" do
    machine = create(:machine ,store: @store)
    other_machine = build(:machine,store: @store, flame_number: machine.flame_number)
    expect(other_machine).to_not be_valid
  end
  
  it "基盤番号がない場合無効である事" do
    machine = build(:machine, board_number: nil ,store: @store)
    expect(machine).to_not be_valid
  end
  
  it "基盤番号が重複している場合無効である事" do
    machine = create(:machine ,store: @store)
    other_machine = build(:machine,store: @store, board_number: machine.board_number)
    expect(other_machine).to_not be_valid
  end
end
