require 'rails_helper'

RSpec.describe AuthenticateUser do
  # create test user
  let(:user) { FactoryBot.create(:user) }
  # valid request subject
  subject(:valid_auth_obj) { described_class.new(user.email, user.password) }
  # invalid request subject
  subject(:invalid_auth_obj) { described_class.new('foo', 'bar') }

  # Test suite for AuthenticateUser#call
  describe '#call' do
    # return token when valid request
    context 'when valid credentials' do
      it 'returns an auth token' do
        token = valid_auth_obj.call
        expect(token).not_to be_nil
      end
    end

    # raise Authentication Error when invalid request
    context 'when invalid credentials' do
      it 'return an authentication error' do
        res = invalid_auth_obj.call
        expect(res.errors[:user_authentication][0]).to eq("invalid credentials")
      end
    end
  end
end