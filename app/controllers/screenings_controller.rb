class ScreeningsController < ApplicationController
  before_action :is_admin, only: [:show, :new, :edit, :create, :update, :destroy]
  before_action :set_screening, only: [:show, :edit, :update, :destroy]

  # GET /screenings
  # GET /screenings.json
  def index
    screenings = Screening.search(params[:screening])
    @screenings = {}
    screenings.each do |screening|
      if @screenings.key?(screening.movie)
        @screenings[screening.movie].append(screening)
      else
        @screenings[screening.movie] = []
        @screenings[screening.movie].append(screening)
      end
    end
    if params[:screening]
      date = params[:screening][:":screening_date"].split('-')
      @date = Date.new(date[0].to_i, date[1].to_i, date[2].to_i)
    else
      @date = Date.today()
    end
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
    respond_to do |format|
      if @screening.destroy
        format.html { redirect_to "/allresources", notice: 'Screening was successfully destroyed.' }
        format.js   { flash[:notice] = 'Screening was succesfully destroyed.'}
        format.json { head :no_content }
      end
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
