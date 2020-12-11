class CartsController < ApplicationController
  # Uses rescue if there is no cart found, shows an error message
  # And redirects the user to the home page
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: [:show, :update, :destroy]
  # Can be accessed only if user signed in
  before_action :authenticate_user!

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # Method created to make a booking automatically based on screenings in the cart
  def create_booking
    # Finding the cart based on the passed parameters
    cart = Cart.find_by(id: cart_params[:cart_id])

    # Creating a booking for every item in the cart, for that user (owner of the cart)
    cart.line_items.each do |item|
      booking = Booking.create(user_id: cart.user_id, movie_title: item.screening.movie.title, booked_date: item.screening.screening_date, booked_time: item.screening.screening_time.strftime("%H:%M"), quantity: item.quantity, cinema: item.screening.cinema, arena: item.screening.arena, total_price: item.total_price)
      booking.save
    end

    # Destroying the cart (and in turn all the line items in the cart) and redirecting the user to the home page
    cart.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: I18n.t('messages.book_success') }
      format.json { head :no_content }
    end
  end


  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: I18n.t('carts.name') + I18n.t('messages.success') + I18n.t('messages.actions.create') }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: I18n.t('carts.name') + I18n.t('messages.success') + I18n.t('messages.actions.update')}
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: I18n.t('carts.name') + I18n.t('messages.success') + I18n.t('messages.actions.destroy') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:user_id, :cart_id)
    end

    # If the cart was not found it redirects the user to home page (uses rescue if record not found)
    def invalid_cart
      redirect_to root_path, notice: I18n.t('carts.name') + I18n.t('messages.not_exist')
    end
end
