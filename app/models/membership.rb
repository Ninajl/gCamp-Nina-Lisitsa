class Membership < ActiveRecord::Base

  belongs_to :user
  belongs_to :project

  enum role: [:member, :owner]

  validates :user_id, presence: true, uniqueness: {scope: :project_id, message: "can't be blank"}
end
