require 'test_helper'

class AdministorsControllerTest < ActionController::TestCase
  setup do
    @administor = administors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administor" do
    assert_difference('Administor.count') do
      post :create, administor: { password: @administor.password, type: @administor.type, username: @administor.username }
    end

    assert_redirected_to administor_path(assigns(:administor))
  end

  test "should show administor" do
    get :show, id: @administor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administor
    assert_response :success
  end

  test "should update administor" do
    patch :update, id: @administor, administor: { password: @administor.password, type: @administor.type, username: @administor.username }
    assert_redirected_to administor_path(assigns(:administor))
  end

  test "should destroy administor" do
    assert_difference('Administor.count', -1) do
      delete :destroy, id: @administor
    end

    assert_redirected_to administors_path
  end
end
