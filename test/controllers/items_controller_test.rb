require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
    @regular = users(:regular)
  end

  test "should get index" do
    login(@regular)
    get items_url
    assert_response :success
  end

  test "should get new" do
    login(@regular)
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    login(@regular)
    assert_difference("Item.count") do
      post items_url, params: { item: { description: @item.description, name: @item.name, price: @item.price } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    login(@regular)
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    login(@regular)
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    login(@regular)
    patch item_url(@item), params: { item: { description: @item.description, name: @item.name, price: @item.price } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    login(@regular)
    assert_difference("Item.count", -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_url
  end
end
