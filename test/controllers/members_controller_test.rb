require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  test 'should return member name and number' do
    sign_in members(:one)
    get :name, number: 1
    assert_response :success
  end

  test 'should return not-found when member is not found' do
    sign_in members(:one)
    get :name, number: -1
    assert_response 404
  end

  test 'redirects unless logged in' do
    get :name, number: 1
    assert_response 302
  end
end
