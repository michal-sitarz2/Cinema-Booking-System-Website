json.extract! screening, :id, :price, :screening_time, :screening_date, :arena, :available_seats, :created_at, :updated_at
json.url screening_url(screening, format: :json)
