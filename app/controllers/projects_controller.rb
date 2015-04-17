class ProjectsController <ApplicationController
  before_action :authenticate
  before_action :set_owner, only: [:edit, :update, :destroy]
  before_action :set_project, only: [:edit,:update, :destroy, :show]


  def index
    if current_user.admin == true
      @projects = Project.all
    else
    @projects = current_user.projects
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      @project.memberships.create(role: :owner, user_id: current_user.id)
      redirect_to project_tasks_path(@project), notice: "Project was successfully created"

    else
      render :new
    end
  end

  def edit

  end

  def show
    @project = Project.find(params[:id])
  end

  def update
    if @project.update(project_params)
      redirect_to project_path, notice: "Project was successfully updated"

    else
      render :edit
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_path, alert: 'Project was successfully destroyed'
    else
      render :index
    end
  end

private
  def project_params
    params.require(:project).permit(:name)
  end

  def set_owner
    @project = Project.find(params[:id])
    unless current_user.project_owner?(@project)
      redirect_to project_path, alert: "You do not have access"
    end
  end

  def set_project
    @project = Project.find(params[:id])
    unless @project.users.include?(current_user)
      redirect_to projects_path, alert: "You do not have access to that project"
  end

end

end
