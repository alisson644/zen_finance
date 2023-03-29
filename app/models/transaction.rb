class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :source

  enum operation: {in: 0, out: 1}

  def total_in_month
    Transaction.where(operation: 'in').where('date_trasaction BETWEEN ? AND ?', Date.today.beginning_of_month, Date.today.end_of_month).pluck(:value).sum
  end
end
