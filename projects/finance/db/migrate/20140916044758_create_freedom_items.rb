class CreateFreedomItems < ActiveRecord::Migration
  def change
    create_table :freedom_items do |t|
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
