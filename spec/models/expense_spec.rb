require 'rails_helper'

RSpec.describe Expense, type: :model do
  before do
    user = FactoryBot.create(:user)
    @expense = FactoryBot.build(:expense, user_id: user.id)
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
        binding.pry
        expect(@expense.errors.full_messages).to include("日時を入力してください")
      end
      it 'expense_category_idが空だと保存できないこと' do
        @expense.expense_category_id = ''
        @expense.valid?
        expect(@expense.errors.full_messages).to include("支出の種類を入力してください")
      end
      it 'expense_category_idは---が選択されている場合は保存できない' do
        @expense.expense_category_id = '1'
        @expense.valid?
        expect(@expense.errors.full_messages).to include("支出の種類を入力してください")
      end
      it 'payment_method_idが空だと保存できないこと' do
        @expense.payment_method_id = ''
        @expense.valid?
        expect(@expense.errors.full_messages).to include("支払方法を入力してください")
      end
      it 'payment_method_idは---が選択されている場合は保存できない' do
        @expense.payment_method_id = ''
        @expense.valid?
        expect(@expense.errors.full_messages).to include("支払方法を入力してください")
      end
      it 'priceが空だと保存できないこと' do
        @expense.price = ''
        @expense.valid?
        expect(@expense.errors.full_messages).to include("金額を入力してください")
      end
      it 'userが紐付いていないと保存できない' do
        @expense.user = nil
        @expense.valid?
        expect(@expense.errors.full_messages).to include("Userを入力してください")
      end

    end
  end
end

