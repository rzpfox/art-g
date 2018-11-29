class AddPhotoToGalleries < ActiveRecord::Migration[5.2]
  def change
    add_column :galleries, :photo, :string
  end
end
