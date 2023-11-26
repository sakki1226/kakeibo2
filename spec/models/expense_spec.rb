require 'rails_helper'

RSpec.describe Expense, type: :model do
  before do
    user = FactoryBot.create(:user)
    family = FactoryBot.create(:family)
    @expense = FactoryBot.build(:expense, user_id: user.id, family_id: family.id)
  end

  describe '支出登録' do
    context '支出が登録できる場合' do
      it 'date, expense_category_id, payment_method_id, price, user_idが存在していれば登録できる' do
        expect(@expense).to be_valid
      end
    end
    context '新規ユーザー登録できない場合' do
      it 'dateが空だと保存できないこと' do
        @expense.date = ''
        @expense.valid?
        expect(@expense.errors.full_messages).to include("Dateを入力してください")
      end
    end
  end
end

