class Message < ApplicationRecord
  validates :title, :text, presence: true
end
