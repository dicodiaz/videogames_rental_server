class CreateVideogames < ActiveRecord::Migration[7.0]
  def change
    create_table :videogames do |t|
      t.string :name, null: false
      t.string :photo, null: false
      t.text :description, null: false
      t.decimal :price_per_day, null: false

      t.timestamps
    end
  end
end
