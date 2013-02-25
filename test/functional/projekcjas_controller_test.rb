require 'test_helper'

class ProjekcjasControllerTest < ActionController::TestCase
  setup do
    @projekcja = projekcjas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projekcjas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create projekcja" do
    assert_difference('Projekcja.count') do
      post :create, projekcja: {  }
    end

    assert_redirected_to projekcja_path(assigns(:projekcja))
  end

  test "should show projekcja" do
    get :show, id: @projekcja
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @projekcja
    assert_response :success
  end

  test "should update projekcja" do
    put :update, id: @projekcja, projekcja: {  }
    assert_redirected_to projekcja_path(assigns(:projekcja))
  end

  test "should destroy projekcja" do
    assert_difference('Projekcja.count', -1) do
      delete :destroy, id: @projekcja
    end

    assert_redirected_to projekcjas_path
  end
end
