require 'test_helper'

class GolfersControllerTest < ActionController::TestCase
  setup do
    @golfer = golfers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:golfers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create golfer" do
    assert_difference('Golfer.count') do
      post :create, golfer: {  }
    end

    assert_redirected_to golfer_path(assigns(:golfer))
  end

  test "should show golfer" do
    get :show, id: @golfer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @golfer
    assert_response :success
  end

  test "should update golfer" do
    patch :update, id: @golfer, golfer: {  }
    assert_redirected_to golfer_path(assigns(:golfer))
  end

  test "should destroy golfer" do
    assert_difference('Golfer.count', -1) do
      delete :destroy, id: @golfer
    end

    assert_redirected_to golfers_path
  end
end
