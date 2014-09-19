class Portfolio < ActiveRecord::Base
	has_many :expenses
	has_many :wins
	has_many :freedom_items
end
