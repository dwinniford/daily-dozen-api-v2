class MealPlan
  include Mongoid::Document
  field :title, type: String
  belongs_to :user 
  has_many :recipes, autosave: true
  has_many :tags, autosave: true

  validates :title, presence: true
end
