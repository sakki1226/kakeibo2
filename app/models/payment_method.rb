class PaymentMethod < ActiveHash::Base

  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: '現金'},
    { id: 3, name: 'カード'},
    { id: 4, name: 'QR決済'},
    { id: 5, name: '引き落とし'},
    { id: 6, name: 'その他'},
  ]

  include ActiveHash::Associations
  has_many :expenses

  end