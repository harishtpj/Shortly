require "test_helper"

class UrlsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get urls_home_url
    assert_response :success
  end

  test "should get about" do
    get urls_about_url
    assert_response :success
  end

  test "should get create" do
    get urls_create_url
    assert_response :success
  end

  test "should get show" do
    get urls_show_url
    assert_response :success
  end
end
