class AddPortfolioToWins < ActiveRecord::Migration
  def change
    add_reference :wins, :portfolio, index: true
  end
end
