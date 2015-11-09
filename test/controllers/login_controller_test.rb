require 'test_helper'

class LoginControllerTest < ActionController::TestCase
	test "should display login form"
		get :new
		assert_response :success
	end

	test "should fail login with bad attempt"
		post :create, {email: "lrose@gmail.com", password: "fail"}
		assert_not_empty flash[:alert]
		assert_redirect_to login_url
	end

	test "should login successfully"
		post :create, {email: "bob@email.com", password: "password"}
		assert_empty flash[:alert]
		assert_not_nil session[:current_user_id]
		assert_response :success
end
