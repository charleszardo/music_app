class User < ActiveRecord::Base
  validates :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :bands, dependent: :destroy
  has_many :albums, through: :bands
  has_many :notes

  attr_reader :password

  after_initialize :ensure_session_token

  def self.find_by_credentials(creds_hash)
    user = User.find_by_email(creds_hash[:email])

    user && user.is_password?(creds_hash[:password]) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def password=(password)
    puts "HIT PASSWORD=!!!!"
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def is_admin?
    self.admin
  end

  def make_admin
    self.admin = true
  end

  def revoke_admin
    self.admin = false
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end
