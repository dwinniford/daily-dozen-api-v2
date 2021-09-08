class Tag
  include Mongoid::Document
  field :recipe_url, type: String
  field :parent, type: String
  field :servings, type: Integer
  field :ingredient, type: String

  embedded_in :meal_plan

  validates :recipe_url, presence: true 
  validates :parent, presence: true 
  validates :servings, presence: true 
  validates :ingredient, presence: true 
end
