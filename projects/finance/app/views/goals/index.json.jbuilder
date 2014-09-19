json.array!(@goals) do |goal|
  json.extract! goal, :id, :name, :price, :image, :complete
  json.url goal_url(goal, format: :json)
end
