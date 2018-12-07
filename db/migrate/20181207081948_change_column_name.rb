class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :exhibitions, :date_time, :dates
  end
end
