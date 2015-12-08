require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
	test "should display login form" do
		get :new
		assert_response :success
		get :show
		assert_response :success
	end

	test "should fail login with bad attempt" do
		post :create, login: {email: "lrose@gmail.com", password: "fail"}
		assert_not_empty flash[:alert]
		assert_redirected_to login_path
	end

	test "should login successfully" do
		post :create, login: {email: "bob@email.com", password: "password"}
		assert_nil flash[:alert]
		assert_not_nil session[:current_user_id]
		assert_redirected_to prayers_path
	end

	test "should log out after log in successful and destroyed" do
		post :create, login: {email: "bob@email.com", password: "password"}
		assert_nil flash[:alert]
		post :destroy
		assert_nil session[:current_user_id]
	end

	test "should navigate to home page" do
		get :root
		assert_response :success
	end
	
end
