require "test_helper"

class ChartkickControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chartkick_index_url
    assert_response :success
  end
end
