class AddUuidToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :token, :string
  end
end
