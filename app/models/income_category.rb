class IncomeCategory < ActiveHash::Base

  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: '給与'},
    { id: 3, name: '賞与'},
    { id: 4, name: 'その他'},
  ]

  include ActiveHash::Associations
  has_many :incomes

  end