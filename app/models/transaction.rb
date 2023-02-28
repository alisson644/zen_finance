class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :source

  enum kind: {in: 0, out: 1}
end
