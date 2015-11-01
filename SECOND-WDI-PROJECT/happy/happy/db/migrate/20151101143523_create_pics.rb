class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.text :url
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
