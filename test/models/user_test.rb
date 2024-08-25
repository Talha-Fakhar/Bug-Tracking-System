require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = FactoryBot.create(:user)
  end

  test "should sign up user with valid data" do
    get new_user_registration_path
    assert_response :success

    post user_registration_path, params: { user: { email: 'newuser@example.com', password: 'password123', password_confirmation: 'password123' } }
    assert_redirected_to root_path
    follow_redirect!
    assert_select "div.alert", "You have signed up successfully."
  end

  test "should not sign up user with invalid data" do
    get new_user_registration_path
    assert_response :success

    post user_registration_path, params: { user: { email: '', password: 'password123', password_confirmation: 'password123' } }
    assert_template 'devise/registrations/new'
    assert_select "div.alert", "prohibited this user from being saved"
  end

  test "should log in user with valid credentials" do
    post user_session_path, params: { user: { email: @user.email, password: 'password123' } }
    assert_redirected_to root_path
    follow_redirect!
    assert_select "div.alert", "Signed in successfully."
  end

  test "should not log in user with invalid credentials" do
    post user_session_path, params: { user: { email: @user.email, password: 'wrongpassword' } }
    assert_template 'devise/sessions/new'
    assert_select "div.alert", "Invalid Email or password."
  end

  test "should log out user" do
    sign_in @user
    delete destroy_user_session_path
    assert_redirected_to root_path
    follow_redirect!
    assert_select "div.alert", "Signed out successfully."
  end

  test "should delete user" do
    sign_in @user
    assert_difference 'User.count', -1 do
      delete user_registration_path(@user)
    end
    assert_redirected_to root_path
    follow_redirect!
    assert_select "div.alert", "Your account has been successfully deleted."
  end
end
