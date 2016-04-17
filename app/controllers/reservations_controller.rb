class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :destroy]
  after_action :verify_authorized, only: [:show, :destroy]
  after_action :verify_policy_scoped, only: :index

  # GET /reservations
  def index
    @reservations = policy_scope(Reservation)
  end

  # GET /reservations/1
  def show
  end

  # GET /reservations/new
  def new
    date = params[:date] ? Date.parse(params[:date]) : Date.today
    @reservation = Reservation.new(date: date)
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.member = current_member

    if @reservation.save
      redirect_to @reservation, notice: 'Reservation was successfully created.'
    else
      render :new
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.update(status: 'cancelled')
    redirect_to reservations_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  # Only allow a trusted parameter "white list" through.
  def reservation_params
    params.require(:reservation).permit(:course_id, :date)
  end
end
