require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  test 'should return member name and number' do
    sign_in members(:one)
    get :name, number: 1
    assert_response :success
  end

  test 'should get index' do
    sign_in members(:one)
    get :name, number: -1
    assert_response 404
  end

  test 'must be logged in' do
    assert_raises UncaughtThrowError do
      get :name, number: 1
    end
  end
end
