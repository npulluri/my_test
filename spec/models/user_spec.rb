require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  describe 'associations' do
    describe 'have_many' do
      it { should have_many(:assignments) }
      it { should have_many(:roles).through(:assignments) }
      it { should have_many(:articles) }
    end
  end
  describe 'validations' do
    describe 'presence of' do
      it {should validate_presence_of(:email)}
      it {should validate_presence_of(:password)}
    end
  end

  describe 'instance methods' do
    let(:user) { FactoryBot.build(:user, :admin) }

    describe "role?" do
      subject {user.role?("admin")}

      context "when the user has a admin role" do
        it 'returns true' do
          expect(subject).to be true
        end
      end

      context "when the user has other than admin role" do
        it 'returns false' do
          expect(user.role?("publisher")).to be false
        end
      end

      let(:publisher){FactoryBot.build(:user, :publisher)}

      context "When the user has a publisher role" do
        it 'returns true' do
          expect(publisher.role?("publisher")).to be true
        end
      end

      context "When the user has other than publisher role" do
        it "returns false" do
          expect(publisher.role?("admin")).to be false
        end
      end

      let(:creator){FactoryBot.build(:user, :creator)}

      context "When the user has creator role" do
        it "return true" do
          expect(creator.role?("creator")).to be true
        end
      end

      context "When the user has other than creator role" do
        it "return false" do
          expect(creator.role?("publisher")).to be false
        end
      end



    end



  end
end
