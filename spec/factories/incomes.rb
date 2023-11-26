FactoryBot.define do
  factory :income do
    date                {'2024-1-1'}
    income_category_id  {2}
    price               {'10000'}
    association :user
  end
end
