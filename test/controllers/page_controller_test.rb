require 'test_helper'

class PageControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get shop" do
    get :shop
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get FAQs" do
    get :FAQs
    assert_response :success
  end

  test "should get Store" do
    get :Store
    assert_response :success
  end

end
