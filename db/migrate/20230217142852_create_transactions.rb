class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :kind
      t.string :description
      t.decimal :value
      t.references :user, null: false, foreign_key: true
      t.references :source, null: false, foreign_key: true
      t.datetime :date_transaction

      t.timestamps
    end
  end
end
