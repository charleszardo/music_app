class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, :session_token, presence: true
  validates :password, presence: { message: "password cannot be blank" }
  validates :password, length: { minimum: 6, allow_nil }
end
