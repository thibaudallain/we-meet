require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get share" do
    get events_share_url
    assert_response :success
  end

  test "should get new" do
    get events_new_url
    assert_response :success
  end

end
