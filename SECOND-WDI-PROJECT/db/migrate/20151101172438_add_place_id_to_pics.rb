class AddPlaceIdToPics < ActiveRecord::Migration
  def change
    add_column :pics, :place_id, :integer
  end
end
