# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
portfolio = Portfolio.create({ name: "Jordan & Anna's Finances", :savings_rate => 0.1 })
expenses = Expense.create([
	{name: "Rent", cost: 600, portfolio_id: 1},
	{name: "Power", cost: 70, portfolio_id: 1},
	{name: "Internet", cost: 45, portfolio_id: 1},
	{name: "Fuel", cost: 80, portfolio_id: 1},
	{name: "Food", cost: 130, portfolio_id: 1}])

wins = Win.create([
	{name: "Jordan's Job", amount: 246, portfolio_id: 1},
	{name: "Anna's Job", amount: 462, portfolio_id: 1},
	{name: "Family Trust", amount: 375, portfolio_id: 1}
])

freedom_items = FreedomItem.create([{name: "Jordan's Allowance", amount: 30, portfolio_id: 1},
	{name: "Anna's Allowance", amount: 50, portfolio_id: 1},
	{name: "Sundays", amount: 20, portfolio_id: 1},
	{name: "Morning Tea Shout", amount: 20, portfolio_id: 1}
])