class CreateExhibitions < ActiveRecord::Migration[5.2]
  def change
    create_table :exhibitions do |t|
      t.string :title
      t.string :location
      t.string :dates
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
