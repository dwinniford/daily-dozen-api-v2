class MealPlan
  include Mongoid::Document
  field :title, type: String
  belongs_to :user 
  embeds_many :recipes
  embeds_many :tags

  validates :title, presence: true
end
