require 'test_helper'

class ScoreByHolesControllerTest < ActionController::TestCase
  setup do
    @score_by_hole = score_by_holes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:score_by_holes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create score_by_hole" do
    assert_difference('ScoreByHole.count') do
      post :create, score_by_hole: {  }
    end

    assert_redirected_to score_by_hole_path(assigns(:score_by_hole))
  end

  test "should show score_by_hole" do
    get :show, id: @score_by_hole
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @score_by_hole
    assert_response :success
  end

  test "should update score_by_hole" do
    patch :update, id: @score_by_hole, score_by_hole: {  }
    assert_redirected_to score_by_hole_path(assigns(:score_by_hole))
  end

  test "should destroy score_by_hole" do
    assert_difference('ScoreByHole.count', -1) do
      delete :destroy, id: @score_by_hole
    end

    assert_redirected_to score_by_holes_path
  end
end
