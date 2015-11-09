require 'test_helper'

class LoginControllerTest < ActionController::TestCase
	test "should display login form" do
		get :new
		assert_response :success
	end

	test "should fail login with bad attempt" do
		post :create, {email: "lrose@gmail.com", password: "fail"}
		assert_not_empty flash[:alert]
		assert_redirected_to login_url
	end

	test "should login successfully" do
		post :create, {email: "bob@email.com", password: "password"}
		assert_nil flash[:alert]
		assert_not_nil session[:current_user_id]
		assert_response :success
	end

	test "should log out after log in successful and destroyed" do
		post :create, {email: "bob@email.com", password: "password"}
		assert_nil flash[:alert]
		post :destroy
		assert_nil session[:current_user_id]
	end

	test "should assign guest to current_user" do
		get :new
		@controller = LoginController.new
		@controller.session = {} 
		assert_true @controller.current_user && @controller.guest?
	end

end
