FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test2@sample'}
    password              {'aaaa1111'}
    password_confirmation {password}
    association :family
  end
end
