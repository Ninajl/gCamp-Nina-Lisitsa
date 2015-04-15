class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :task

  validates  :post, presence: true
end
