require 'rails_helper'
RSpec.describe Article, type: :model do

  describe 'associations' do
    describe 'belongs_to' do
      it {should belong_to(:user)}
    end
  end

  describe 'validations' do
    describe 'presence of' do
      it {should validate_presence_of(:title)}
      it {should validate_presence_of(:name)}
      it {should validate_presence_of(:content)}
    end
  end

end