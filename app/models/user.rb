class User < ActiveRecord::Base
  has_and_belongs_to_many :projects

  # Validate name:
  validates :name,
    presence: true,
    length: { maximum: 50 }

  # Validate email address:
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # Validate password length:
  validates :password,
    length: { minimum: 8 }

  # Secure password features:
  has_secure_password

  # Add handlers to run when creating and saving
  before_create :create_remember_token
  before_save :format_email

  # Create session token:
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  # Create hashed token:
  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
  
  def format_email
    email.downcase!
  end

  # Creates a new session token for the user:
  def create_remember_token
    remember_token = User.hash(User.new_remember_token)
  end
end
