class User < ApplicationRecord
  has_many :recipes

  validates_confirmation_of :password
  validates :username, :email, presence: true
  validates :email, :username, uniqueness: true
  validate :validate_password

  def password
    @password ||= BCrypt::Password.new(pw_hash)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.pw_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password == password
      return user
    else
      nil
    end
  end

  def validate_password
    if @raw_password.nil?
      errors.add(:password, "is required")
    elsif @raw_password.length < 4
      errors.add(:password, "must be greater than 3 characters")
    end
  end

end

