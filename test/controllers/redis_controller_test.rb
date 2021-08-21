require "test_helper"

class RedisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get redis_index_url
    assert_response :success
  end
end
