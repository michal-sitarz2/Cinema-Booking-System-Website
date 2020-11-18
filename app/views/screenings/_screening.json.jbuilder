json.extract! screening, :id, :num_seats, :num_sold, :screening_date, :screening_time, :arena, :price, :created_at, :updated_at
json.url screening_url(screening, format: :json)
