class TasksController < ApplicationController
  before_action :authenticate
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:index, :edit,:update, :destroy, :show]

  # GET /tasks
  # GET /tasks.json
  def index
    @project = Project.find(params[:project_id])
    @tasks = @project.tasks
  end

  def new
    @task = Task.new
    @project = Project.find(params[:project_id])
  end

  def create
    @task = Task.new(task_params)
    @project = Project.find(params[:project_id])
    @task.project_id = params[:project_id]
    if @task.save
      redirect_to project_task_path(@project, @task), notice: 'Task was successfully created.'

    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @comment = Comment.new
    @comments = @task.comments.all
  end


  def edit
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
  end


  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to project_task_path(@project,@task), notice: 'Task was successfully updates.'

    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @task.destroy
      redirect_to project_tasks_path(@project), alert: 'Task was successfully destroyed.'
    end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :task_due_date, :completed, :project_id)
    end

    def set_project
      @project = Project.find(params[:project_id])
      unless @project.users.include?(current_user) || current_user.admin == true
        redirect_to projects_path, alert: "You do not have access to that project"
      end
    end
end
