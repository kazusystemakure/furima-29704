require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user1 = FactoryBot.create(:user)
    item1 = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user1, item_id: item1)
  end

  describe '購入先情報入力テスト' do
    context 'データ保存成功' do
      it '全ての項目が存在すれば登録できること' do
        expect(@order_address).to be_valid
      end
    end

    context 'データ保存失敗' do
      it 'postal_codeが空では登録できないこと' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeがハイフンなしでは登録できないこと' do
        @order_address.postal_code = 1_234_567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code Input correctly')
      end

      it 'prefectureが空では登録できない' do
        @order_address.prefecture = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture Select')
      end

      it 'cityが空では登録できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では登録できないこと' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では登録できないこと' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
