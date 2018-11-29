class AddPhoneNumberToGalleries < ActiveRecord::Migration[5.2]
  def change
    add_column :galleries, :phone_number, :string
  end
end
