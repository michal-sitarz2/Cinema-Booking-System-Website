json.extract! movie, :id, :title, :director, :genre, :duration, :year, :country, :release_date, :poster, :summary, :actors, :created_at, :updated_at
json.url movie_url(movie, format: :json)
