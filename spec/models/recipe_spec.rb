require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it "has a valid factory" do 
    recipe = FactoryBot.build(:recipe)
    expect(recipe.valid?).to be_truthy
  end
end
