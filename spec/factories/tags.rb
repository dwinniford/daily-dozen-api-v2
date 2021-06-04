FactoryBot.define do
  factory :tag do
    recipe_url { "MyString.com" }
    parent { "berries" }
    servings { 1 }
    ingredient { "raspberry" }

    association :meal_plan
  end
end
