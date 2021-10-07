require 'test_helper'

class Public::HerbsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_herbs_index_url
    assert_response :success
  end

  test "should get show" do
    get public_herbs_show_url
    assert_response :success
  end
end
