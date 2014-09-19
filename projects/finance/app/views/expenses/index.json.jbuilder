json.array!(@expenses) do |expense|
  json.extract! expense, :id, :name, :cost
  json.url expense_url(expense, format: :json)
end
