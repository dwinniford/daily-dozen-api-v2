require 'bcrypt'
class User
  include Mongoid::Document
  include BCrypt 
  field :name, type: String
  field :password_digest, type: String

  validates :name, presence: true, uniqueness: true, length: {minimum: 5, maximum: 20}
  validates :password, presence: true, length: {minimum: 5, maximum: 20}

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
