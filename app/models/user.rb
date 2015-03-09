class User < ActiveRecord::Base

  has_many :memberships
  has_many :projects, through: :memberships

  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def fullname
    "#{first_name} #{last_name}"
  end

end
