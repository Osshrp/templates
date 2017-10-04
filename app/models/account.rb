class Account < ApplicationRecord
  validates :balance, :currency, :name, presence: true
end
