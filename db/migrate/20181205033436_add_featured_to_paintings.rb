class AddFeaturedToPaintings < ActiveRecord::Migration[5.2]
  def change
    add_column :paintings, :featured, :boolean, default: false
  end
end
