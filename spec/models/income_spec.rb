require 'rails_helper'

RSpec.describe Income, type: :model do
  before do
    user = FactoryBot.create(:user)
    @income = FactoryBot.build(:income, user_id: user.id)
  end

  describe '収入登録' do
    context '収入が登録できる場合' do
      it 'date, income_category_id, price, user_idが存在していれば登録できる' do
        expect(@income).to be_valid
      end
    end
    context '新規ユーザー登録できない場合' do
      it 'dateが空だと保存できないこと' do
        @income.date = ''
        @income.valid?
        expect(@income.errors.full_messages).to include("日時を入力してください")
      end
      it 'income_category_idが空だと保存できないこと' do
        @income.income_category_id = ''
        @income.valid?
        expect(@income.errors.full_messages).to include("収入の種類を入力してください")
      end
      it 'income_category_idは---が選択されている場合は保存できない' do
        @income.income_category_id = '1'
        @income.valid?
        expect(@income.errors.full_messages).to include("収入の種類を入力してください")
      end
      it 'priceが空だと保存できないこと' do
        @income.price = ''
        @income.valid?
        expect(@income.errors.full_messages).to include("金額を入力してください")
      end
      it 'userが紐付いていないと保存できない' do
        @income.user = nil
        @income.valid?
        expect(@income.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end