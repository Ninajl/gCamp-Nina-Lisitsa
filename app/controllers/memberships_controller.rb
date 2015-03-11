class MembershipsController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @memberships = @project.memberships.all
    # @membership = Membership.find(params[:id])

  end

  def create
    @membership = Membership.new(membership_params)

  end

  private
  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :role)
  end

end
