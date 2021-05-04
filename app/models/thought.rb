class Thought < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :head, presence: true, length: { maximum: 140 }
end
