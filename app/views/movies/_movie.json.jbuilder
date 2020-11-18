json.extract! movie, :id, :title, :director, :genre, :duration, :country, :release_date, :poster, :summary, :created_at, :updated_at
json.url movie_url(movie, format: :json)
