class Family < ApplicationRecord
  has_many :users
  has_many :blogs

  validates :name, uniqueness: true
end
