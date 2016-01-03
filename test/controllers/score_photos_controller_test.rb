require 'test_helper'

class ScorePhotosControllerTest < ActionController::TestCase
  setup do
    @score_photo = score_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:score_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create score_photo" do
    assert_difference('ScorePhoto.count') do
      post :create, score_photo: { description: @score_photo.description, img_url: @score_photo.img_url, name: @score_photo.name, order: @score_photo.order, score_id: @score_photo.score_id }
    end

    assert_redirected_to score_photo_path(assigns(:score_photo))
  end

  test "should show score_photo" do
    get :show, id: @score_photo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @score_photo
    assert_response :success
  end

  test "should update score_photo" do
    patch :update, id: @score_photo, score_photo: { description: @score_photo.description, img_url: @score_photo.img_url, name: @score_photo.name, order: @score_photo.order, score_id: @score_photo.score_id }
    assert_redirected_to score_photo_path(assigns(:score_photo))
  end

  test "should destroy score_photo" do
    assert_difference('ScorePhoto.count', -1) do
      delete :destroy, id: @score_photo
    end

    assert_redirected_to score_photos_path
  end
end
