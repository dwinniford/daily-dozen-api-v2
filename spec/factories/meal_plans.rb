FactoryBot.define do
  factory :meal_plan do
    title { "MyString" }
    association :user
  end
end
