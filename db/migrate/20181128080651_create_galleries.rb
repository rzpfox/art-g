class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :address
      t.string :contact_name

      t.timestamps
    end
  end
end
