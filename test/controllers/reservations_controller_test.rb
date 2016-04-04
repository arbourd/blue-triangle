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

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create reservation' do
    assert_difference('Reservation.count') do
      post :create, reservation: { course_id: @reservation.course_id, date: Date.today + rand, member_id: @reservation.member_id }
    end

    assert_redirected_to reservation_path(assigns(:reservation))
  end

  test 'should show reservation' do
    get :show, id: @reservation
    assert_response :success
  end

  test 'should destroy reservation' do
    assert_difference('Reservation.count', -1) do
      delete :destroy, id: @reservation
    end

    assert_redirected_to reservations_path
  end
end
