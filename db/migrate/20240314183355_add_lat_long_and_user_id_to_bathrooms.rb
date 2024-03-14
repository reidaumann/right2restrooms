class AddLatLongAndUserIdToBathrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :bathrooms, :latitude, :float
    add_column :bathrooms, :longitude, :float
    add_column :bathrooms, :user_id, :integer, null: false, foreign_key: true
  end
end
