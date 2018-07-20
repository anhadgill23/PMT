class TaskMembersController < ApplicationController
    def index
    end

    def create
        @task = Task.find(params[:task_id])
        @user = User.find(member_params[:id])
        @task.users.push(@user)
        @task.save
        redirect_to team_project_task_path(team_id: params[:team_id], project_id: params[:project_id], id: params[:task_id])
    end

    def destroy
        @team = Task.find(params[:task_id])
        @user = User.find(params[:id])
        @team.users.delete(@user)
        @team.save
        redirect_to team_project_task_path(team_id: params[:team_id], project_id: params[:project_id], id:params[:task_id])
    end


    private

    def member_params
        params.require(:taskMembers).permit(:id)
    end
end