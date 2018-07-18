class TeamMembersController < ApplicationController
    def create
        @team = Team.find(params[:team_id])
        @user = User.find(member_params[:id])
        @team.users.push(@user)
        @team.save
        redirect_to team_path(id:params[:team_id])
    end

    def destroy
    end

    private

    def member_params
        params.require(:teamMembers).permit(:id)
    end
end