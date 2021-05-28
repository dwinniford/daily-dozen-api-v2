require 'rails_helper'

RSpec.describe MealPlan, type: :model do
  it "has a valid factory" do 
    meal_plan = FactoryBot.build(:meal_plan)
    expect(meal_plan.valid?).to be_truthy
  end   
end
