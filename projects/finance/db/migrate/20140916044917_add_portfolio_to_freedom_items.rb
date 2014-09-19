class AddPortfolioToFreedomItems < ActiveRecord::Migration
  def change
    add_reference :freedom_items, :portfolio, index: true
  end
end
