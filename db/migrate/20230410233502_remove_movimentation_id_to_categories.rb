class RemoveMovimentationIdToCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :movimentation_id
  end
end
