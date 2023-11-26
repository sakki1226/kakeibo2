FactoryBot.define do
  factory :expense do
    date                {'2024-1-1'}
    expense_category_id {2}
    payment_method_id   {2}
    price               {'10000'}
  end
end
