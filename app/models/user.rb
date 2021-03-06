require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest::SHA256.new

  VALID_COLOR_REGEX = /\A#\h{6}\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_USER_REGEX = /\A[a-z0-9_]+\z/i

  attr_accessor :password

  has_many :questions, dependent: :destroy
  has_many :asked_questions, class_name: 'Question', foreign_key: :author_id,
           dependent: :nullify

  validates :email, presence: true,
            uniqueness: true,
            format: { with: VALID_EMAIL_REGEX }
  validates :username, presence: true,
            uniqueness: true,
            length: { minimum: 2, maximum: 40 },
            format: { with: VALID_USER_REGEX }
  validates :favorite_color, format: { with: VALID_COLOR_REGEX }
  validates_presence_of :password, on: :create
  validates_confirmation_of :password

  before_save :encrypt_password
  before_validation :username_downcase
  before_validation :email_downcase

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email&.downcase)
    return unless user.present?
    hashed_password = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST
      )
    )

    user if user.password_hash == hashed_password
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(
          password, password_salt, ITERATIONS, DIGEST.length, DIGEST
        )
      )
    end
  end

  def username_downcase
    username&.downcase!
  end

  def email_downcase
    email&.downcase!
  end
end
