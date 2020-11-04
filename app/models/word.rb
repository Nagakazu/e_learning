class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices

  default_scope -> { order('created_at DESC') }

  validates :word, presence: true
  validates :category_id, presence: true

  def correct_answer
    choices.find_by(correct: true).choice 
  end
end
