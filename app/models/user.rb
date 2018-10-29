class User < ApplicationRecord
  # encrypt password
  has_secure_password

  has_many :assignments
  has_many :roles, through: :assignments
  has_many :articles

  validates_presence_of :email, :password

  def role?(role)
    roles.any?{ |r| r.name == role }
  end

end
