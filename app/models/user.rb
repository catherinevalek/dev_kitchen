class User < ApplicationRecord
  has_many :recipes

  validates_confirmation_of :password
  validates :username, :email, :pw_hash, presence: true
  validates :email, :username, uniqueness: true


  def password
    @password ||= BCrypt::Password.new(pw_hash)
  end

  def password=(new_password)
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

end
