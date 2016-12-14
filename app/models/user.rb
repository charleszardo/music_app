class User < ActiveRecord::Base
  validates :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_reader :password

  after_initialize :ensure_session_token

  def self.find_by_credentials(creds_hash)
    user = User.find_by_email(cres_hash[:email])

    if user

    else
      flash[:errors] = "Invalid credentials"
    end
  end

  def password=(password)
    puts "HIT PASSWORD=!!!!"
    self.password_digest = BCrypt::Password.create(password)
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end
end
