require 'test_helper'

class PrayersControllerTest < ActionController::TestCase
	test "should display new prayers and no prayers for guest" do
		get :index
		assert_response :success
	end

	test "should allow new posts for guests" do
		get :index
		assert_difference('Post.count') do
			post :create, prayer: {title: "test", body: "test"}
		end
		assert_redirected_to prayers_path
	end

	test "should reject blank titles" do
		post :create, prayer: {body: "not blank"}
		assert_not_nil flash[:alert]
	end

	test "navigate to edit Prayer" do
		get(:edit, {id: posts(:prayer).id}, {user_id: posts(:prayer).person_id})
	end

	test "should update existing prayer" do
		patch(:update, {
			id: posts(:prayer).id, 
			prayer: {title: "new", body: "new body"}
			}, {user_id: posts(:prayer).person_id}
		)
		assert_response :success
	end


	test "should find Prayer outside user context through show" do
		get(:show, {id: posts(:prayer).id})
		assert_response :success
	end

end
