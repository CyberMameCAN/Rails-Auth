class TasksController < ApplicationController
    before_action :authenticate_user!

    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end
    
    def create
        puts `[create]`
        @task = Task.create(task_params)
        # redirect_to @tasks

        # @todo = Todo.new(todo_params)
        # ログインユーザーのIDを挿入
        @task.User_id = current_user.id

        respond_to do |format|
            if @task.save()
                format.html {redirect_to tasks_path, notice: 'User was successfully created.'}
            else
                format.html {render :new}
            end
        end

    end
    
    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        @task.update(task_params)
        redirect_to tasks_path
    end

    def destroy
        puts `[destroy]`

        @task = Task.find(params[:id])
        @task.destroy
        # redirect_to tasks_path

        respond_to do |format|
            format.html { redirect_to tasks_path, notice: 'User was successfully destroyed.' }
        end
    end

private
    def task_params
        params.require(:task).permit(:title)
    end

end
