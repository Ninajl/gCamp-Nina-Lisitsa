class User < ActiveRecord::Base
  has_secured_password
  validates :first_name, :last_name, :email, presence: true, uniqueness: true

  def fullname
    "#{first_name} #{last_name}"
  end

end
