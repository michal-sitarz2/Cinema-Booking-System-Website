class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings_history = Booking.find_user(current_user.id).booking_history
    @bookings = Booking.find_user(current_user.id).booking_upcoming
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: I18n.t('bookings.name') + I18n.t('messages.success') + I18n.t('messages.actions.create') }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: I18n.t('bookings.name') + I18n.t('messages.success') + I18n.t('messages.actions.update.')}
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: I18n.t('bookings.name') + I18n.t('messages.success') + I18n.t('messages.actions.cancel') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:user_id, :movie_title, :booked_date, :booked_time, :quantity, :cinema, :arena, :total_price)
    end
end
