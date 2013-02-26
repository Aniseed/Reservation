require 'test_helper'

class RezerwacjasControllerTest < ActionController::TestCase
  setup do
    @rezerwacja = rezerwacjas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rezerwacjas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rezerwacja" do
    assert_difference('Rezerwacja.count') do
      post :create, rezerwacja: {  }
    end

    assert_redirected_to rezerwacja_path(assigns(:rezerwacja))
  end

  test "should show rezerwacja" do
    get :show, id: @rezerwacja
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rezerwacja
    assert_response :success
  end

  test "should update rezerwacja" do
    put :update, id: @rezerwacja, rezerwacja: {  }
    assert_redirected_to rezerwacja_path(assigns(:rezerwacja))
  end

  test "should destroy rezerwacja" do
    assert_difference('Rezerwacja.count', -1) do
      delete :destroy, id: @rezerwacja
    end

    assert_redirected_to rezerwacjas_path
  end
end
