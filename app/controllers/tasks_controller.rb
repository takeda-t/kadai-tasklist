class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "Taskが正常に登録されました。"
      redirect_to @task
    else
      flash.now[:danger] = "Taskが登録されませんでした。"
      render :new
    end
  end
  
  def new
    @task = Task.new
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = "タスクは正常に更新されました。"
      redirect_to @task
    else
      flash.now[:danger] = "タスクは更新されませんでした。"
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = "タスクは正常に削除されました。"
    redirect_to tasks_url
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content)
  end
  
end