class ChangeTransactionsToMovimentations < ActiveRecord::Migration[7.0]
  def change
    rename_table :transactions, :movimentations
  end
end
