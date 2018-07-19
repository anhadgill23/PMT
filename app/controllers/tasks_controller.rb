class TasksController < ApplicationController
    def new
        @task = Task.new
    end

    def index
        @tasks = Task.where(project_id: params[:project_id])
    end

    def create
        @task = Task.new(task_params)
        @task.project_id = params[:project_id]
        @task.save
        if(@task.save)
            redirect_to team_project_tasks_path(team_id: params[:team_id], project_id: params[:project_id], task_id: task.id)
            flash.alert = "Created Task"
        else    
            render :action => :new  
            flash.alert = 'Could not create task'
        end
    end

    def show
        @task = Task.find(params[:id])
    end

    private

    def task_params
        params.require(:task).permit(:title, :body, :due_date, :images)
    end
end
