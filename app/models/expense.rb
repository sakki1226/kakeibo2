class Expense < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  with_options presence: true do
    validates :date, :price, :user_id
    validates :expense_category_id, :payment_method_id, numericality: { other_than: 1, message: "can't be blank" } 
  end
end