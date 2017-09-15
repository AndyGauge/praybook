require 'test_helper'

class PraisesControllerTest < ActionDispatch::IntegrationTest

	test "should display new praises and no praises for guest" do
		get praises_path
		assert_response :success
	end

	test "should allow new posts for guests" do
		get praises_path
		assert_difference('Post.count') do
			post praises_path, params: {
				  praise: { title: "test", body: "test" }
				}
		end
		assert_redirected_to praises_path
	end

	test "should reject blank titles" do
		post praises_path, params: {
			  praise: { body: "not blank" }
			}
		assert_not_nil flash[:alert]
	end

	test "navigate to edit praise" do
		post login_path, params: {
				login: {
					email: people(:person_with_name).email,
					password: "password"
				}
			}
		get edit_praise_path(posts(:praise))
		assert_response :success
	end

	test "should update existing praise" do
		post login_path, params: {
				login: {
					email: people(:person_with_name).email,
					password: "password"
				}
			}
		patch praise_path(posts(:praise)), params: {
				praise: {title: "new", body: "new body"},
			}
		assert_redirected_to praises_path
	end

	test "should find one page of praise" do
		get praise_path(1)
		assert_response :success
	end

end
