json.extract! user, :id, :name, :password_digest, :email, :address, :phone, :created_at, :updated_at, :reviews, :cart, :wishlist
json.url user_url(user, format: :json)
