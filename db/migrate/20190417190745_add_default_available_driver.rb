class AddDefaultAvailableDriver < ActiveRecord::Migration[5.2]
  def change
    change_column_default(
      :drivers,
      :active,
      true,
    )
  end
end
