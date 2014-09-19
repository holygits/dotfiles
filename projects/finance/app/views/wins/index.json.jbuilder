json.array!(@wins) do |win|
  json.extract! win, :id, :name, :amount
  json.url win_url(win, format: :json)
end
