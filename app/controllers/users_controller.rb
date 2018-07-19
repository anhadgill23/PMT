class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
    
    def create
    end
    
    def edit
    end

    def destroy
        @team = Team.find params[:id]
        @team.users.delete_all
        @team.destroy
        redirect_to teams_path
        flash.alert = 'The team is deleated'
    end


end
