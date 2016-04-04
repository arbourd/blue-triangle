class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :destroy]

  # GET /reservations
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
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
    @reservation.destroy
    redirect_to reservations_url, notice: 'Reservation was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def reservation_params
    params.require(:reservation).permit(:course_id, :date)
  end
end
