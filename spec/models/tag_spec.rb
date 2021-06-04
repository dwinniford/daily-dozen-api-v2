require 'rails_helper'

RSpec.describe Tag, type: :model do
  it 'has a valid factory' do 
    tag = FactoryBot.build(:tag)
    expect(tag.valid?).to be_truthy
  end
end
