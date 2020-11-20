require 'rails_helper'

describe OrderAddress do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '商品の購入がうまくいくとき' do
      it "postal_code、area_id、city、house_number、phone_number、tokenが存在すれば登録できる" do
        expect(@order_address).to be_valid
      end
    end

    context '商品の購入がうまくいかないとき' do
      it "postal_codeがないと登録できない" do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
      it "postal_codeが半角数字以外だと登録できない" do
        @order_address.postal_code = "１２３−４５６７"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      it "postal_codeがハイフンなしだと登録できない" do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      it "area_idが未選択だと登録できない" do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area must be other than 1")
      end
      it "cityがないと登録できない" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank", "City is invalid")
      end
      it "cityが全角のひらがな、カタカナ、漢字以外だと登録できない" do
        @order_address.city = "000"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City is invalid")
      end
      it "phone_numberがないと登録できない" do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it "phone_numberが11桁以内でないと登録できない" do
        @order_address.phone_number = "012345678900"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが半角数字のみでないと登録できない" do
        @order_address.phone_number = "０１２３４５６７８９０"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenがないと登録できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end