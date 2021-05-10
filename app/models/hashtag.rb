class Hashtag < ApplicationRecord
  HASHTAG_REGEX = /#[[:word:]]+/

  has_and_belongs_to_many :questions

  validates :name, format: { with: HASHTAG_REGEX }
  validates :name, presence: true, length: { minimum: 2, maximum: 40 }

  before_save :downcase_hashtag

  scope :user_questions, -> { joins(:questions) }

  private

  def downcase_hashtag
    name&.downcase!
  end
end
