class Transaction < ApplicationRecord
  belongs_to :transaction_type
  belongs_to :recipient
  belongs_to :store
end
