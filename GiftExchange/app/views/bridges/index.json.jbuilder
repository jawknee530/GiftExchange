json.array!(@bridges) do |bridge|
  json.extract! bridge, :id, :user_id, :exchange_id
  json.url bridge_url(bridge, format: :json)
end
