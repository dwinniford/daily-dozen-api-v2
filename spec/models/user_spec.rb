require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    user = FactoryBot.build(:user)
    # byebug
    # pp user
    expect(user.valid?).to be_truthy
    
  end
end