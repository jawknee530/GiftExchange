json.array!(@exchanges) do |exchange|
  json.extract! exchange, :id, :name, :description, :deadline, :date
  json.url exchange_url(exchange, format: :json)
end
