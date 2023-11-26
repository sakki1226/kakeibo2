FactoryBot.define do
  factory :user do
    nickname              {'ようこ'}
    email                 {'sample2@sample'}
    password              {'88888888'}
    password_confirmation {'88888888'}
  end

  factory :expense do
    date                {'2024-1-1'}
    expense_category_id {2}
    payment_method_id   {2}
    price               {'10000'}
    association :user
  end
end
