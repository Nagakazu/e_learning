class Category < ApplicationRecord
  has_many :lessons
  has_many :words, dependent: :destroy

  default_scope -> { order('created_at DESC') }

  validates :title, presence: true
  validates :description, presence: true
  # validates :word_id, presence: true
end
