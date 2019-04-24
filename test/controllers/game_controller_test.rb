require 'test_helper'

class GameControllerTest < ActionDispatch::IntegrationTest
  test "should get sum" do
    get game_sum_url
    assert_response :success
  end

end
