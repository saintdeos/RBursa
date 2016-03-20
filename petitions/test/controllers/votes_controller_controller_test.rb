require 'test_helper'

class VotesControllerControllerTest < ActionController::TestCase
  test "should get user_id:integer" do
    get :user_id:integer
    assert_response :success
  end

  test "should get petition_id:integer" do
    get :petition_id:integer
    assert_response :success
  end

end
