json.extract! booking, :id, :user_id, :movie_title, :booked_date, :booked_time, :quantity, :cinema, :arena, :total_price, :created_at, :updated_at
json.url booking_url(booking, format: :json)
