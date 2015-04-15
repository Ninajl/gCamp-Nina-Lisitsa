class AboutController <ApplicationController
  before_action :authenticate

  def index
    @projects = Project.all
    @tasks = Task.all
    @users =  User.all
    @comments = Comment.all
    @memberships = Membership.all
  end
end
