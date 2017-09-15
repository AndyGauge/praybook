require 'test_helper'

class PrayersControllerTest <  ActionDispatch::IntegrationTest

	test "should display new prayers and no prayers for guest" do
		get prayers_path
		assert_response :success
	end

	test "should allow new posts for guests" do
		get prayers_path
		assert_difference('Post.count') do
			post prayers_path, params: {
				  prayer: { title: "test", body: "test" }
			  }
		end
		assert_redirected_to prayers_path
	end

	test "should reject blank titles" do
		post prayers_path, params: {
			  prayer: { body: "not blank" }
			}
		assert_not_nil flash[:alert]
	end

	test "navigate to edit Prayer" do
		post login_path, params: {
				login: { email: people(:person_with_name).email,
					password: "password" }
			}
		get edit_prayer_path(posts(:prayer))
		assert_response :success
	end

	test "should update existing prayer" do
		post login_path, params: {
				login: { email: people(:person_with_name).email,
					password: "password" }
			}
		patch prayer_path(posts(:prayer)), params: {
					prayer: { title: "new", body: "new body" },
		  }
		assert_redirected_to prayers_path
	end

	test "should find Prayer and prayer_for on one page" do
		Prayer.per_page=30  # Default
		post login_path, params: {
				login: { email: people(:person_with_name).email,
					password: "password" }
			}
		get prayer_path(1)
		assert_response :success
	end

	test "should find Prayer_for after prayers" do
		Prayer.per_page=2  # Default
		post login_path, params: {
				login: { email: people(:person_with_name).email,
					password: "password" }
			}
		get prayer_path(2)
		assert_response :success
	end

	test "should remove prayer when complete" do
		post login_path, params: {
				login: { email: people(:person_with_name).email,
					password: "password" }
			}
		post complete_prayer_path(posts(:prayer)), params: {
				prayer: {}
			}
		assert_redirected_to prayers_path
	end

end
