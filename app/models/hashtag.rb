class Hashtag < ApplicationRecord
  HASHTAG_REGEX = /#[[:word:]]+/

  has_many :hashtag_questions, dependent: :destroy
  has_many :questions, through: :hashtag_questions

  validates :name, presence: true

  scope :user_questions, -> { joins(:questions) }
end
