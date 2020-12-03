class ScreeningsController < ApplicationController
  before_action :set_screening, only: [:show, :edit, :update, :destroy]


  # GET /screenings
  # GET /screenings.json
  def index
    @screenings = Screening.search(params[:screening])
  end

  # GET /screenings/1
  # GET /screenings/1.json
  def show
  end

  # GET /screenings/new
  def new
    @screening = Screening.new
  end

  # GET /screenings/1/edit
  def edit
  end

  # POST /screenings
  # POST /screenings.json
  def create
    @screening = Screening.new(screening_params)
# movie: @movie, price: screening_params[:price], screening_time: screening_params[:screening_time], arena: screening_params[:arena], available_seats: screening_params[:available_seats]
    respond_to do |format|
      if @screening.save
        format.html { redirect_to "/allresources", notice: 'Screening was successfully created.' }
        format.json { render :show, status: :created, location: "/allresources" }
      else
        format.html { render :new }
        format.json { render json: @screening.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /screenings/1
  # PATCH/PUT /screenings/1.json
  def update
    respond_to do |format|
      if @screening.update(screening_params)
        format.html { redirect_to "/allresources", notice: 'Screening was successfully updated.' }
        format.json { render :show, status: :ok, location: "/allresources" }
      else
        format.html { render :edit }
        format.json { render json: @screening.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /screenings/1
  # DELETE /screenings/1.json
  def destroy
    @screening.destroy
    respond_to do |format|
      format.html { redirect_to "/allresources", notice: 'Screening was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screening
      @screening = Screening.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def screening_params
      params.require(:screening).permit(:movie_id, :screening_type, :screening_date, :cinema, :price, :screening_time, :arena, :available_seats)
    end
end
