class User < ActiveRecord::Base
  has_secure_password

  has_many :memberships, dependent: :destroy
  has_many :projects, through: :memberships

  has_many :comments
  has_many :tasks, through: :comments

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def fullname
    "#{first_name} #{last_name}"
  end

end
