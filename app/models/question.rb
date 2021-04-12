class Question < ApplicationRecord
  belongs_to :user

  validates :user, :text, presence: true, length: { maximum: 255 }
end
