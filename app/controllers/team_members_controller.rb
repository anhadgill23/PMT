class TeamMembersController < ApplicationController
    def create
        @team = Team.find(params[:team_id])
        @user = User.find(member_params[:id])
        @team.users.push(@user)
        @team.save
        redirect_to team_path(id:params[:team_id])
    end

    def destroy
        @team = Team.find(params[:team_id])
        @user = User.find(params[:id])
        @tasks = Task.all
        @tasks.where(project_id: @team.projects.ids).each do |task|
          task.users.delete(@user)
        end
        @team.users.delete(@user)
        @team.save
        redirect_to teams_path
    end

    private

    def member_params
        params.require(:teamMembers).permit(:id)
    end
end