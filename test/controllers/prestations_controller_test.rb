require "test_helper"

class PrestationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get prestations_new_url
    assert_response :success
  end

  test "should get create" do
    get prestations_create_url
    assert_response :success
  end

  test "should get edit" do
    get prestations_edit_url
    assert_response :success
  end

  test "should get update" do
    get prestations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get prestations_destroy_url
    assert_response :success
  end
end
