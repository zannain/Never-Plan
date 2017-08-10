require 'test_helper'

class YelpsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get yelps_search_url
    assert_response :success
  end

end
