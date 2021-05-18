class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_many :hashtag_questions, dependent: :destroy
  has_many :hashtags, through: :hashtag_questions

  after_save_commit :create_hashtags

  validates :text, presence: true, length: { maximum: 255 }

  private

  def create_hashtags
    self.hashtags =
      "#{text} #{answer}".
        downcase.
        scan(Hashtag::HASHTAG_REGEX).
        uniq.
        map { |tag| Hashtag.find_or_create_by!(name: tag.delete("#")) }
  end
end
