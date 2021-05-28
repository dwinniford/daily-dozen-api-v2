require 'rails_helper'

RSpec.describe MealPlan, type: :model do
  it "has a valid factory" do 
    meal_plan = FactoryBot.build(:meal_plan)
    expect(meal_plan.valid?).to be_truthy
  end 
  it "has valid factory for building a meal plan with recipes" do 
    meal_plan_with_recipes = FactoryBot.build(:meal_plan_with_recipes)
    expect(meal_plan_with_recipes.valid?).to be_truthy
  end 
  
end
