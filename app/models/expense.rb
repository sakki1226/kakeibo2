class Expense < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  with_options presence: true do
    validates :expense_category_id, :payment_method_id, numericality: { other_than: 1, message: "を入力してください" } 
    validates :date, :price, :user_id
  end
end