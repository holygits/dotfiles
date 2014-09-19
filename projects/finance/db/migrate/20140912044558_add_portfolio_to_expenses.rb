class AddPortfolioToExpenses < ActiveRecord::Migration
  def change
    add_reference :expenses, :portfolio, index: true
  end
end
