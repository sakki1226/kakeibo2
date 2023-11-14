class Income < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  with_options presence: true do
    validates :date, :price, :user_id
    validates :income_category_id, numericality: { other_than: 1, message: "can't be blank" } 
  end

end