class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @comment = Comment.new(comment_params)
    @comment.task_id = params[:task_id]
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to project_task_path(@project, @task), notice: "Comment was successfully created!"
    else
      redirect_to project_task_path(@project, @task), notice: "Blank comment was not created!"
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:task_id, :user_id, :post)
  end
end
