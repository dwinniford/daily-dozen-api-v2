class MealPlan
  include Mongoid::Document
  field :title, type: String
  belongs_to :user 
  has_many :recipes
  has_many :tags

  validates :title, presence: true
end
