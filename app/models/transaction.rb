class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :source

  enum operation: {in: 0, out: 1}

  scope :filter_for_date, ->(search = Time.now) { where('date_transaction >= :start_date AND date_transaction <= :end_date',
    {:start_date => Time.new(search.year, search.month, search.day) - 3.hours, :end_date => Time.new(search.year, search.month, search.day, 20, 59)}) }

  scope :filter_atual_month_trasactions, -> { where('date_transaction BETWEEN ? AND ?', Date.today.beginning_of_month, Date.today.end_of_month) }

  scope :sum_value, -> { pluck(:value).sum }

  def total_in_month
    Transaction.where(operation: 'in').where('date_trasaction BETWEEN ? AND ?', Date.today.beginning_of_month, Date.today.end_of_month).pluck(:value).sum
  end
end
