json.array!(@freedom_items) do |freedom_item|
  json.extract! freedom_item, :id, :name, :amount
  json.url freedom_item_url(freedom_item, format: :json)
end
