require "test_helper"

class ProductionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get productions_index_url
    assert_response :success
  end

  test "should get new" do
    get productions_new_url
    assert_response :success
  end

  test "should get create" do
    get productions_create_url
    assert_response :success
  end

  test "should get edit" do
    get productions_edit_url
    assert_response :success
  end

  test "should get update" do
    get productions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get productions_destroy_url
    assert_response :success
  end
end
