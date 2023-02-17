json.extract! transaction, :id, :kind, :description, :value, :user_id, :source_id, :date_transaction, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
