json.array!(@subscribers) do |subscriber|
  json.extract! subscriber, :id, :string
  json.url subscriber_url(subscriber, format: :json)
end
