class Recipe
  include Mongoid::Document
  field :url, type: String
  field :label, type: String
  field :ingredient_lines, type: Array
  field :source, type: String
  field :image, type: String

  embedded_in :meal_plan

  validates :url, presence: true
end
