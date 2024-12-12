require "test_helper"

class ActifsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get actifs_index_url
    assert_response :success
  end

  test "should get new" do
    get actifs_new_url
    assert_response :success
  end

  test "should get create" do
    get actifs_create_url
    assert_response :success
  end

  test "should get show" do
    get actifs_show_url
    assert_response :success
  end

  test "should get edit" do
    get actifs_edit_url
    assert_response :success
  end

  test "should get update" do
    get actifs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get actifs_destroy_url
    assert_response :success
  end
end
