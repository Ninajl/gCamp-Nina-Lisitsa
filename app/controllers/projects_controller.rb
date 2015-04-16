class ProjectsController <ApplicationController
  before_action :authenticate
  before_action :set_owner, only: [:edit, :update, :destroy]


  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      project_owner
      redirect_to @project, notice: "Project was successfully created"

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
      redirect_to project_path, notice: "Sorry you do not have access"
    end
  end

end
