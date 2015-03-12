class Membership < ActiveRecord::Base

  belongs_to :user
  belongs_to :project

  enum role: [:member, :owner]

  validates :user_id, presence: true, uniqueness: true
end
