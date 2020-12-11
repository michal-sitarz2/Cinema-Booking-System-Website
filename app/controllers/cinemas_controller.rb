class CinemasController < ApplicationController
  before_action :is_admin, except: [:index]
  before_action :set_cinema, only: [:edit, :update, :destroy]

  # GET /cinemas
  # GET /cinemas.json
  def index
    @cinemas = Cinema.all
    @counter = 0
  end


  # GET /cinemas/new
  def new
    @cinema = Cinema.new
  end

  # GET /cinemas/1/edit
  def edit
  end

  # POST /cinemas
  # POST /cinemas.json
  def create
    @cinema = Cinema.new(cinema_params)

    respond_to do |format|
      if @cinema.save
        format.html { redirect_to allresources_url, notice: I18n.t('cinemas.name') + I18n.t('messages.success') + I18n.t('messages.actions.create') }
        format.json { render :show, status: :created, location: allresources_url }
      else
        format.html { render :new }
        format.json { render json: @cinema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cinemas/1
  # PATCH/PUT /cinemas/1.json
  def update
    respond_to do |format|
      if @cinema.update(cinema_params)
        format.html { redirect_to allresources_url, notice: I18n.t('cinemas.name') + I18n.t('messages.success') + I18n.t('messages.actions.update') }
        format.json { render :show, status: :ok, location: allresources_url }
      else
        format.html { render :edit }
        format.json { render json: @cinema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cinemas/1
  # DELETE /cinemas/1.json
  def destroy
    @cinema.destroy
    respond_to do |format|
      format.html { redirect_to allresources_url, notice: I18n.t('cinemas.name') + I18n.t('messages.success') + I18n.t('messages.actions.destroy') }
      format.js   { flash[:notice] = I18n.t('cinemas.name') + I18n.t('messages.success') + I18n.t('messages.actions.destroy')}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cinema
      @cinema = Cinema.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cinema_params
      params.require(:cinema).permit(:name, :address, :image)
    end

end
