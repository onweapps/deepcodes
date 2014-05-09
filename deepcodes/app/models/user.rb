require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :dual_n_backs

  validates :email, presence: true
  validates :email, uniqueness: :true
  validates :password, presence: true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :message => "invalid email" }


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end


