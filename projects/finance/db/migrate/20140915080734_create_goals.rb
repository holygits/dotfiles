class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.decimal :price
      t.string :image
      t.decimal :complete

      t.timestamps
    end
  end
end
