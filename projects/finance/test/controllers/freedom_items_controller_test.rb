require 'test_helper'

class FreedomItemsControllerTest < ActionController::TestCase
  setup do
    @freedom_item = freedom_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:freedom_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create freedom_item" do
    assert_difference('FreedomItem.count') do
      post :create, freedom_item: { amount: @freedom_item.amount, name: @freedom_item.name }
    end

    assert_redirected_to freedom_item_path(assigns(:freedom_item))
  end

  test "should show freedom_item" do
    get :show, id: @freedom_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @freedom_item
    assert_response :success
  end

  test "should update freedom_item" do
    patch :update, id: @freedom_item, freedom_item: { amount: @freedom_item.amount, name: @freedom_item.name }
    assert_redirected_to freedom_item_path(assigns(:freedom_item))
  end

  test "should destroy freedom_item" do
    assert_difference('FreedomItem.count', -1) do
      delete :destroy, id: @freedom_item
    end

    assert_redirected_to freedom_items_path
  end
end
