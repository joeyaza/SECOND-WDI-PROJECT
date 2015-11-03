class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :country
      t.string :place
      t.references :pic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
