require 'test_helper'

class TopLevelsControllerTest < ActionController::TestCase
  setup do
    @top_level = top_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:top_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create top_level" do
    assert_difference('TopLevel.count') do
      post :create, top_level: @top_level.attributes
    end

    assert_redirected_to top_level_path(assigns(:top_level))
  end

  test "should show top_level" do
    get :show, id: @top_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @top_level
    assert_response :success
  end

  test "should update top_level" do
    put :update, id: @top_level, top_level: @top_level.attributes
    assert_redirected_to top_level_path(assigns(:top_level))
  end

  test "should destroy top_level" do
    assert_difference('TopLevel.count', -1) do
      delete :destroy, id: @top_level
    end

    assert_redirected_to top_levels_path
  end
end
