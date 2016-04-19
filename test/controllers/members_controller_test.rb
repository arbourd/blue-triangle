require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  test 'redirects unless logged in' do
    get :name, number: 1
    assert_response 302
  end
end
