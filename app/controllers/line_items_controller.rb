class LineItemsController < ApplicationController
  # Uses the current cart
  include CurrentCart

  before_action :set_line_item, only: [:update, :destroy]
  # When the line item is created, it needs to be put into a cart
  before_action :set_cart, only: [:create]
  # Only accessible when users are logged in
  before_action :authenticate_user!

  # Line items do not need any views as they are just used to store items
  # in the cart. Once the cart is destroyed or emptied they are destroyed with it
  # They are used to save a booking if user Books a screening.

  # POST /line_items
  # POST /line_items.json
  def create
    # Finds screenings based on the screening id
    screening = Screening.find(params[:screening_id])
    # Adds the newly created item to a cart
    @line_item = @cart.add_item(screening)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to cart_url(@cart.id), notice: I18n.t('items.name') + I18n.t('messages.success') + I18n.t('messages.actions.add') }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_url(@cart.id), notice: I18n.t('items.name') + I18n.t('messages.success') + I18n.t('messages.actions.remove')}
      format.js   { flash[:notice] = I18n.t('items.name') + I18n.t('messages.success') + I18n.t('messages.actions.remove')}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:cart_id, :screening_id)
    end
end
