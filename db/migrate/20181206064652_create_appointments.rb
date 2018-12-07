class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.boolean :confirmed, default: false
      t.datetime :start_time
      t.string :visitor_email
      t.string :visitor_name
      t.references :user, foreign_key: true
      t.references :gallery, foreign_key: true

      t.timestamps
    end
  end
end
