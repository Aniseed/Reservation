require 'test_helper'

class KinosControllerTest < ActionController::TestCase
  setup do
    @kino = kinos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kinos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kino" do
    assert_difference('Kino.count') do
      post :create, kino: {  }
    end

    assert_redirected_to kino_path(assigns(:kino))
  end

  test "should show kino" do
    get :show, id: @kino
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kino
    assert_response :success
  end

  test "should update kino" do
    put :update, id: @kino, kino: {  }
    assert_redirected_to kino_path(assigns(:kino))
  end

  test "should destroy kino" do
    assert_difference('Kino.count', -1) do
      delete :destroy, id: @kino
    end

    assert_redirected_to kinos_path
  end
end
