require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
	test "can get new user form" do
		get new_user_path
		assert_response :success
	end

	test "can submit user blank" do
		post user_path, params: {
			user: {
		    name: "",
		    email: "",
		    password: ""
	    }
	  }
		assert_response :success
	end

	test "should create new user" do
		assert_difference('User.count') do
			post user_path, params: {
				user: {
			    name: "UserControllerTest:test_user",
			    email: "test_user@UserControllerTest",
			    password: "passw0RD"
		    }
		  }
		end
		assert_redirected_to user_url
	end

	test "should inflect User class on person" do
		get user_path
		assert_response :success
	end

	test "should create Person when trying application" do
		assert_difference('Person.count') do
			get edit_user_path
		end
		assert_response :success
	end

	test "should update User" do
		put user_path, params: {
			user: {
			  name: "UserControllerTest:updateuser",
			  email: "update_user@UserControllerTest",
			  password: "passw0RD"
			}
		}
		assert_redirected_to user_url
	end

	test "should not update guest with bad password" do
		put user_path, params: {
			user: {
				name: "UserControllerTest:updateuser",
				email: "update_user@UserControllerTest",
				password: ""
			}
		}
		assert_response :success
	end

	test "should not update user with bad name" do
		put user_path, params: {
			user: {
				name: "",
				email: "update_user@UserControllerTest",
				password: "passw0RD"
			}
		}
		assert_response :success
	end

end
