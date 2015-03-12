class MembershipsController < ApplicationController

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
    @membership.update(membership_params)
      redirect_to project_memberships_path(@project), notice: "#{@membership.user.fullname} was successfully updated!"
  end

  def destroy
    @project = Project.find(params[:project_id])
    @membership = Membership.find(params[:id])
    @membership.destroy
    redirect_to project_memberships_path(@project), notice: "#{@membership.user.fullname} was successfully destroyed!"
  end

  private

  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :role)
  end

end
