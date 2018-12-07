class AddPhotoToSamples < ActiveRecord::Migration[5.2]
  def change
    add_column :samples, :photo, :string
  end
end
