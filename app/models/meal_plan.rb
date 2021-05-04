class MealPlan
  include Mongoid::Document
  field :title, type: String
  belongs_to :user 

  validates :title, presence: true
end
