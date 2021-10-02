require 'test_helper'

class Admin::HerbsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_herbs_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_herbs_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_herbs_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_herbs_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_herbs_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_herbs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_herbs_destroy_url
    assert_response :success
  end

end
