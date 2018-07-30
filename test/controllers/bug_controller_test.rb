require 'test_helper'

class BugControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bug_index_url
    assert_response :success
  end

end
