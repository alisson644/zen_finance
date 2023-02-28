class AddUserIdToSources < ActiveRecord::Migration[7.0]
  def change
    add_reference :sources, :user, null: false, foreign_key: true
  end
end
