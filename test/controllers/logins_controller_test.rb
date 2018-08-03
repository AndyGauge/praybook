require 'test_helper'

class LoginsControllerTest < ActionDispatch::IntegrationTest
	test "should display login form" do
		skip("Devise")
		get new_login_path
		assert_response :success
		get login_path
		assert_response :success
	end

	test "should fail login with bad attempt" do
		skip("Devise")
post login_path, params: {
			  login: { email: "lrose@gmail.com", password: "fail" }
			}
		assert_not_empty flash[:alert]
		assert_redirected_to login_path
	end

	test "should login successfully" do
		skip("Devise")
post login_path, params: {
			  login: { email: "bob@email.com", password: "password" }
			}
		assert_nil flash[:alert]
		assert_not_nil session[:current_user_id]
		assert_redirected_to prayers_path
	end

	test "should log out after log in successful and destroyed" do
		skip("Devise")
post login_path, params: {
			  login: {email: "bob@email.com", password: "password"}
			}
		assert_nil flash[:alert]
		get logout_path
		assert_nil session[:current_user_id]
	end

	test "should navigate to home page" do
		get root_path
		assert_response :success
	end

end
