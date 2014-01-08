require 'test_helper'

class JoinsControllerTest < ActionController::TestCase
  setup do
    @join = joins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:joins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create join" do
    assert_difference('Join.count') do
      post :create, join: { association_type: @join.association_type, email: @join.email, message: @join.message }
    end

    assert_redirected_to join_path(assigns(:join))
  end

  test "should show join" do
    get :show, id: @join
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @join
    assert_response :success
  end

  test "should update join" do
    patch :update, id: @join, join: { association_type: @join.association_type, email: @join.email, message: @join.message }
    assert_redirected_to join_path(assigns(:join))
  end

  test "should destroy join" do
    assert_difference('Join.count', -1) do
      delete :destroy, id: @join
    end

    assert_redirected_to joins_path
  end
end
