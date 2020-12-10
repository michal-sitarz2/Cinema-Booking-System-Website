class LineItemsController < ApplicationController
  include CurrentCart

  before_action :set_line_item, only: [:update, :destroy]
  before_action :set_cart, only: [:create]
  before_action :authenticate_user!

  # POST /line_items
  # POST /line_items.json
  def create
    screening = Screening.find(params[:screening_id])
    @line_item = @cart.add_item(screening)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to cart_url(@cart.id), notice: 'Item was successfully added.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to cart_url(@cart.id), notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_url(@cart.id), notice: 'Item was successfully removed.'}
      format.js   { flash[:notice] = 'Item was removed.'}
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
