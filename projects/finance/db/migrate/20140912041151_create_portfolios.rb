class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
    	t.string :name
    	t.decimal :income
    	t.decimal :expense_total
    	t.decimal :savings_rate

      t.timestamps
    end
  end
end
