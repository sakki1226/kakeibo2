require 'rails_helper'

RSpec.describe Expense, type: :model do
  before do
    @expense = FactoryBot.build(:expense)
  end

  describe '支出登録' do
    context '支出が登録できる場合' do
      it 'date, expense_category_id, payment_method_id, priceが存在していれば登録できる' do
        expect(@expense).to be_valid
      end
    end
    context '新規ユーザー登録できない場合' do
      it 'dateが空だと保存できないこと' do
        @expense.date = ''
        @expense.valid?
        expect(@expense.errors.full_messages).to include("家族名を入力してください")
      end
    end
  end
end

