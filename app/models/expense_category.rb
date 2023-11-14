class ExpenseCategory < ActiveHash::Base

  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: '食費'},
    { id: 3, name: '外食'},
    { id: 4, name: 'コンビニ'},
    { id: 5, name: '日用品費'},
    { id: 6, name: '交際費'},
    { id: 7, name: '衣服費'},
    { id: 8, name: '医療費'},
    { id: 9, name: 'その他'},
    { id: 10, name: '家賃'},
    { id: 11, name: '電気代'},
    { id: 12, name: 'ガス代'},
    { id: 13, name: '水道代'},
    { id: 14, name: '電気代'},
    { id: 15, name: '保険'},
    { id: 16, name: '携帯代'},
    
  ]

  include ActiveHash::Associations
  has_many :expenses

  end