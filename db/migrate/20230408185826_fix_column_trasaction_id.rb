class FixColumnTrasactionId < ActiveRecord::Migration[7.0]
  def change
    rename_column :categories, :transaction_id, :movimentation_id
  end
end
