class ScreeningsController < ApplicationController
  # Users are not allowed to perform any actions except viewing show
  # Only admin can perform the other actions and visit other views
  before_action :is_admin, except: [:index]
  before_action :set_screening, only: [:edit, :update, :destroy]

  # GET /screenings
  # GET /screenings.json
  def index
    # Checking if the parameters are defined

    # Getting the date specified from the parameters
    date = screening_params[:screening_date].split('-')
    # Converting it from string to date to be used in the view
    @date = Date.new(date[0].to_i, date[1].to_i, date[2].to_i)

    # Uses a Screening method searching for screenings with
    # specific date and specific cinema, passed in through parameters.
    screenings = Screening.search(screening_params)

    # Using a hash map to map movies to screenings on that day and in that cinema
    @screenings = {}
    screenings.each do |screening|
      # If there is already a movie with the key then the screening is appended to already existing movie
      if @screenings.key?(screening.movie)
        @screenings[screening.movie].append(screening)
      # Else the movie is added as the key and an empty array is defined as the key
      else
        @screenings[screening.movie] = []
        # Add the screening as the value of the array corresponding to that movie
        @screenings[screening.movie].append(screening)
      end
    end

    # Iterating through all the movies in the hash
    @screenings.each do |movie, screening|
        # Sorting each screening array based on the screening_time
        screening = screening.sort_by {|s| s.screening_time}
        # Replacing the previous screening time with the sorted array of screenings for that movie
        @screenings[movie] = screening
    end
  end

  # If a parameters are missing (specifically in the index)
  # The program will take the user to the book tickets view
  rescue_from ActionController::ParameterMissing do |exception|
    redirect_to '/booking'
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
        format.html { redirect_to allresources_url, notice: I18n.t('screenings.name') + I18n.t('messages.success') + I18n.t('messages.actions.create') }
        format.json { render :show, status: :created, location: allresources_url }
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
        format.html { redirect_to allresources_url, notice: I18n.t('screenings.name') + I18n.t('messages.success') + I18n.t('messages.actions.update')}
        format.json { render :show, status: :ok, location: allresources_url }
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
        format.html { redirect_to allresources_url, notice: I18n.t('screenings.name') + I18n.t('messages.success') + I18n.t('messages.actions.destroy')}
        format.js   { flash[:notice] = I18n.t('screenings.name') + I18n.t('messages.success') + I18n.t('messages.actions.destroy')}
      else
        format.html { redirect_to allresources_url, notice: I18n.t('screenings.name') + I18n.t('messages.fail_in_use')}

      end
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
