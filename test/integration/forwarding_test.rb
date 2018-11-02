# frozen_string_literal: true

require "test_helper"

# Tests for friendly forwarding.
class ForwardingTest < ActionDispatch::IntegrationTest
  setup do
    @regular = users(:regular)
  end

  test "should friendly forward to root path" do
    login(@regular)
    assert_equal root_path, path
  end

  test "should friendly forward to items index" do
    get items_url
    assert_redirected_to new_user_session_url
    login(@regular)
    assert_equal items_path, path
  end

  test "should friendly forward to new item page" do
    get new_item_url
    assert_redirected_to new_user_session_url
    login(@regular)
    assert_equal new_item_path, path
  end
end
