class User < ApplicationRecord
  has_many :recipes

  validates :username, :email, :pw_hash, presence: true
  validates :email, :username, uniqueness: true


  def password
    @password ||= BCrypt::Password.new(pw_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.pw_hash = @password
  end

end
