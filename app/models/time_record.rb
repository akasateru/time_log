class TimeRecord < ApplicationRecord
  belongs_to :user
  validates :time, presence: true, format: {with: /\A\d{2}:\d{2}:\d{2}\z/ }
  default_scope -> { order(created_at: :desc) }
end
