json.array!(@users) do |user|
  json.extract! user, :id, :email, :password, :name, :surname
  json.url user_url(user, format: :json)
end
