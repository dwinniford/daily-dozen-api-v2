FactoryBot.define do
  factory :recipe do
    url { "MyString" }
    label { "MyString" }
    ingredient_lines { ["1 carrot", "2 broccoli", "1 can beans"] }
    source { "MyString" }
    image { "MyString" }

    association :meal_plan
  end
end
