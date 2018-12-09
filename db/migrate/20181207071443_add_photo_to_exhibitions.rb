class AddPhotoToExhibitions < ActiveRecord::Migration[5.2]
  def change
    add_column :exhibitions, :photo, :string
  end
end
