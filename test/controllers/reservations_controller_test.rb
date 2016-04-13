require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase
  setup do
    @reservation = reservations(:one)
    sign_in members(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:reservations)
  end

  test 'should get index of only users reservations' do
    sign_in members(:two)
    get :index
    assert_response :success
    assert_empty assigns(:reservations)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create reservation' do
    assert_difference('Reservation.count') do
      post :create, reservation: { course_id: @reservation.course_id,
                                   date: Date.today + rand }
    end

    assert_redirected_to reservation_path(assigns(:reservation))
  end

  test 'should show reservation' do
    get :show, id: @reservation
    assert_response :success
  end

  test 'should not show reservation if not owned by member' do
    sign_in members(:two)
    assert_raises Pundit::NotAuthorizedError do
      get :show, id: @reservation
    end
  end

  test 'should destroy reservation' do
    assert_no_difference('Reservation.count') do
      delete :destroy, id: @reservation
    end
    assert_equal(assigns(:reservation).status, 'cancelled')

    assert_redirected_to reservations_path
  end

  test 'should not destroy reservation if not owned by member' do
    sign_in members(:two)
    assert_no_difference('Reservation.count') do
      assert_raises Pundit::NotAuthorizedError do
        delete :destroy, id: @reservation
      end
    end
  end
end
