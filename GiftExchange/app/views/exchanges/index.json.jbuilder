json.array!(@exchanges) do |exchange|
  json.extract! exchange, :id, :name, :Description, :Deadline, :Date, :user_id
  json.url exchange_url(exchange, format: :json)
end
