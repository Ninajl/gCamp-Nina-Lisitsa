class MembershipsController < ApplicationController

  before_action :set_project, only: [:edit,:update, :index, :destroy]
  before_action :set_owner, only: [:edit, :update]


  def index
    @project = Project.find(params[:project_id])
    @memberships = @project.memberships.all
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(membership_params)
    @project = Project.find(params[:project_id])
    @membership.project_id = params[:project_id]
    if @membership.save
      redirect_to project_memberships_path(@project), notice: "#{@membership.user.fullname} was successfully added!"
    else
      render :index
    end
  end

  def show
  end

  def edit
  end

  def update
    @project = Project.find(params[:project_id])
    @membership = Membership.find(params[:id])
     if @membership.update(membership_params)
      redirect_to project_memberships_path(@project), notice: "#{@membership.user.fullname} was successfully updated!"
    else
      render :index
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @membership = Membership.find(params[:id])
    if @membership.destroy && @membership.user.id == current_user.id
      redirect_to projects_path, notice: "#{@membership.user.fullname} was successfully removed!"
    else
      redirect_to project_memberships_path(@project), notice: "#{@membership.user.fullname} was successfully destroyed!"
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :role)
  end

  def set_project
    @project = Project.find(params[:project_id])
    unless @project.users.include?(current_user) || current_user.admin == true
      redirect_to projects_path, alert: "You do not have access to that project"
    end
  end

  def set_owner
    @project = Project.find(params[:project_id])
    unless current_user.project_owner?(@project)
      redirect_to project_path, alert: "You do not have access"
    end
  end

end
