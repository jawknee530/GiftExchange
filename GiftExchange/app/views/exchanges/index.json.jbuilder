json.array!(@exchanges) do |exchange|
  json.extract! exchange, :id, :name, :descripton, :dealine, :date, :user_id
  json.url exchange_url(exchange, format: :json)
end
