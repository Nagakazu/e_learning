class Category < ApplicationRecord
  # belongs_to :lesson

  default_scope -> { order('created_at DESC') }

  validates :title, presence: true
  validates :description, presence: true
  # validates :word_id, presence: true
end
