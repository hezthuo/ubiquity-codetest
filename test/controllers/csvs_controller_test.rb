require "test_helper"

class CsvsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get csvs_index_url
    assert_response :success
  end

  test "should get show" do
    get csvs_show_url
    assert_response :success
  end

  test "should get new" do
    get csvs_new_url
    assert_response :success
  end

  test "should get edit" do
    get csvs_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get csvs_destroy_url
    assert_response :success
  end
end
