require 'test_helper'

class OrderIsSectorsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get order_is_sectors_show_url
    assert_response :success
  end

end
