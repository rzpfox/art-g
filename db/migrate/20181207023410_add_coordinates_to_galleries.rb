class AddCoordinatesToGalleries < ActiveRecord::Migration[5.2]
  def change
    add_column :galleries, :latitude, :float
    add_column :galleries, :longitude, :float
  end
end
