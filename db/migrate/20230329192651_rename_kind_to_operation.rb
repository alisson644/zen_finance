class RenameKindToOperation < ActiveRecord::Migration[7.0]
  def change
    rename_column :transactions, :kind, :operation
  end
end
