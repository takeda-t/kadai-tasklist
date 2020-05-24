class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :show, :update, :destroy]
  def index
    @tasks = current_user.tasks
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = "Taskが正常に登録されました。"
      redirect_to root_url
    else
      flash.now[:danger] = "Taskが登録されませんでした。"
      render new_task_path
    end
  end
  
  def new
    @task = Task.new
  end
  
  def edit
  end
  
  def show
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = "タスクは正常に更新されました。"
      redirect_to root_url
    else
      flash.now[:danger] = "タスクは更新されませんでした。"
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = "タスクを削除しました。"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
