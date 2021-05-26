class MealPlan
  include Mongoid::Document
  field :title, type: String
  belongs_to :user 
  has_many :recipes

  validates :title, presence: true
end
