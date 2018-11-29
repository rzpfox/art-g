class AddPhotoToPaintings < ActiveRecord::Migration[5.2]
  def change
    add_column :paintings, :photo, :string
  end
end
