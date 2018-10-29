module AuthenticationSpecHelper
  def sign_in_as_a_valid_user
    @user ||= FactoryBot.build(:user, :admin)
    @user.reset_authentication_token! unless @user.authentication_token
    set_cookie "authentication_token=#{@user.authentication_token}"
  end
end

RSpec.configure do |config|
  config.include AuthenticationSpecHelper, :type=>:api
end