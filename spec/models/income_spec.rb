require 'rails_helper'

RSpec.describe Income, type: :model do
  before do
    @income = FactoryBot.build(:income)
  end

  describe '収入登録' do
    context '収入が登録できる場合' do
      it 'date, income_category_id, priceが存在していれば登録できる' do
        expect(@income).to be_valid
      end
    end
    context '新規ユーザー登録できない場合' do
      it 'dateが空だと保存できないこと' do
        @income.date = ''
        @income.valid?
        expect(@income.errors.full_messages).to include("日付を入力してください")
      end
    end
  end
end
