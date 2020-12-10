class MoviesController < ApplicationController
  before_action :is_admin, except: [:show]
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to allresources_url, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: allresources_url }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to allresources_url, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: allresources_url }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    # Defining a flag which determines whether a movie can be deleted
    check = true

    # If there is a booking with the movie, the movie cannot be deleted
    if Booking.where(movie_title: @movie.title).first
      check = false
    end

    # If the movie was already not found as booked
    # The program will check are there any screenings in users' carts
    if check
      @movie.screenings.each do |screening|
        if screening.line_items.length > 0
          check = false
          break
        end
      end
    end

    # If the screenings can be deleted the movie and its corresponding screenings are deleted
    if check
      @movie.screenings.destroy_all
      @movie.destroy
      respond_to do |format|
        format.html { redirect_to allresources_url, notice: 'Movie was successfully destroyed.' }
        format.js   { flash[:notice] = 'Movie was succesfully destroyed.'}
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to allresources_url, notice: 'Movie cannot be destroyed - the associated screenings are in use.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :director, :genre, :duration, :country, :release_date, :poster, :summary, :actors, :video, :restrictions)
    end
end
