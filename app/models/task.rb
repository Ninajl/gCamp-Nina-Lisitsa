class Task < ActiveRecord::Base
  belongs_to :project

  has_many :comments, :dependent => :destroy
  has_many :users, through: :comments

  validates :description, presence: true, uniqueness: true
end
