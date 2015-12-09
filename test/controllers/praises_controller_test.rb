require 'test_helper'

class PraisesControllerTest < ActionController::TestCase
	test "should display new praises and no praises for guest" do
		get :index
		assert_response :success
	end

	test "should allow new posts for guests" do
		get :index
		assert_difference('Post.count') do
			post :create, praise: {title: "test", body: "test"}
		end
		assert_redirected_to praises_path
	end

	test "should reject blank titles" do
		post :create, praise: {body: "not blank"}
		assert_not_nil flash[:alert]
	end

	test "navigate to edit praise" do
		get(:edit, {id: posts(:praise).id}, {user_id: posts(:praise).person_id})
	end

	test "should update existing praise" do
		patch(:update, 
					id: posts(:praise).id, 
					praise: {title: "new", body: "new body"}, 
					user_id: posts(:praise).person_id
				 )
		assert_redirected_to praises_path
	end

	test "should find praise outside user context through show" do
		get(:show, {id: posts(:praise).id})
		assert_response :success
	end

	end

end
