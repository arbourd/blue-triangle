require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  test 'should return index' do
    sign_in members(:one)
    get :index

    assert_response :success
    response = JSON.parse(@response.body)

    assert 'available_slots'.in?(response[0].keys)
    assert_equal 4, response[0].keys.length
  end
end
