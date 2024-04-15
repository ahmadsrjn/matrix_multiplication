require "test_helper"

class MatricesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get matrices_index_url
    assert_response :success
  end
end
