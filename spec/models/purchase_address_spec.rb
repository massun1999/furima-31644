require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    context "配送先が正しく保存されるとき" do
      it 'tokenと配送情報が全て正しく入力されていれば保存できる' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @purchase_address.building = ""
        expect(@purchase_address).to be_valid
      end
    end

    context "配送情報が保存されないとき" do
      it 'postalが空だと保存されない' do
        @purchase_address.postal = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal can't be blank")
      end
      it 'postalにハイフンがないと保存されない' do
        @purchase_address.postal = '5101323'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal is invalid")
      end
      it 'postalのハイフンの前が4桁以上だと保存されない' do
        @purchase_address.postal = '5101-3232'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal is invalid")
      end
      it 'postalのハイフンの前が2桁以下だと保存されない' do
        @purchase_address.postal = '51-1324'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal is invalid")
      end
      it 'postalのハイフンの後が5桁以上だと保存されない' do
        @purchase_address.postal = '510-12345'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal is invalid")
      end
      it 'postalのハイフンの後が3桁桁以下だと保存されない' do
        @purchase_address.postal = '510-123'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal is invalid")
      end
      it 'prefecture_idが空だと保存されない' do
        @purchase_address.prefecture_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが0だと保存されない' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it 'prefecture_idが文字列だと保存されない' do
        @purchase_address.prefecture_id = '三'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'cityが空だと保存されない' do
        @purchase_address.city = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存されない' do
        @purchase_address.house_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phoneが空だと保存されない' do
        @purchase_address.phone = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが12桁以上だと保存されない' do
        @purchase_address.phone = 123456789123
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneに数値以外の文字列が含まれると保存されない' do
        @purchase_address.phone = '080-00-8923'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone is invalid")
      end
      it 'tokenが空だと保存されない' do
        @purchase_address.token = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
