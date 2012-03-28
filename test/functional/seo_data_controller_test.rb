require 'test_helper'

class SeoDataControllerTest < ActionController::TestCase
  setup do
    @seo_datum = seo_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seo_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seo_datum" do
    assert_difference('SeoDatum.count') do
      post :create, seo_datum: @seo_datum.attributes
    end

    assert_redirected_to seo_datum_path(assigns(:seo_datum))
  end

  test "should show seo_datum" do
    get :show, id: @seo_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seo_datum
    assert_response :success
  end

  test "should update seo_datum" do
    put :update, id: @seo_datum, seo_datum: @seo_datum.attributes
    assert_redirected_to seo_datum_path(assigns(:seo_datum))
  end

  test "should destroy seo_datum" do
    assert_difference('SeoDatum.count', -1) do
      delete :destroy, id: @seo_datum
    end

    assert_redirected_to seo_data_path
  end
end
