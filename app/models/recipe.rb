class Recipe
  include Mongoid::Document
  field :url, type: String
  field :label, type: String
  field :ingredient_lines, type: Array
  field :source, type: String
  field :image, type: String

  belongs_to :meal_plan

  validates :url, presence: true
end
