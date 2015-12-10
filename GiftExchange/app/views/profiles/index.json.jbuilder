json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :description, :address, :user_id, :exchange_id
  json.url profile_url(profile, format: :json)
end
