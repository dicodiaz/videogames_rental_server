class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]
  before_action :authenticate_user!

  # GET /reservations
  def index
    @reservations = current_user.reservations.includes([:videogame]).order(updated_at: :desc)

    render json: @reservations.map { |reservation| ReservationSerializer.new(reservation).serializable_hash[:data] }
  end

  # GET /reservations/1
  def show
    if @reservation
      render json: ReservationSerializer.new(@reservation).serializable_hash[:data]
    else
      render json: { error: 'Reservation not found' }, status: :not_found
    end
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: ReservationSerializer.new(@reservation).serializable_hash[:data], status: :created,
             location: @reservation
    else
      render json: { error: @reservation.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1
  def update
    return render json: { error: 'Reservation not found' }, status: :not_found unless @reservation

    if @reservation.update(reservation_params)
      render json: ReservationSerializer.new(@reservation).serializable_hash[:data]
    else
      render json: { error: @reservation.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    if @reservation
      @reservation.destroy
      render json: { message: 'Reservation deleted' }, status: :ok
    else
      render json: { error: 'Reservation not found' }, status: :not_found
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:videogame_id, :days, :total_price).merge(user: current_user)
  end
end
