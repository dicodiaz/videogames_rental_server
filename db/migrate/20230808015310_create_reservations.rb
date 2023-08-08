class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :videogame, null: false, foreign_key: true
      t.integer :days, null: false
      t.decimal :total_price, null: false

      t.timestamps
    end
  end
end
