class Word < ApplicationRecord
  belongs_to :category
  has_many :choices

  default_scope -> { order('created_at DESC') }

  validates :word, presence: true
  validates :category_id, presence: true
end
