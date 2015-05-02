require 'test_helper'

class UsetsControllerTest < ActionController::TestCase
  setup do
    @uset = usets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uset" do
    assert_difference('Uset.count') do
      post :create, uset: { name: 'sam', password: 'secret', password_confirmation: 'secret' }
    end
    assert_redirected_to usets_path
  end

  test "should show uset" do
    get :show, id: @uset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @uset
    assert_response :success
  end

  test "should update uset" do
    patch :update, id: @uset, uset: { name: @uset.name, password: 'secret', password_confirmation: 'secret' }
    assert_redirected_to usets_path
  end

  test "should destroy uset" do
    assert_difference('Uset.count', -1) do
      delete :destroy, id: @uset
    end

    assert_redirected_to usets_path
  end
end
