class TeamsController < ApplicationController
    # before_action :isManager?, only: [:create, :new]
    # before_action :isAdmin?, only: [:destroy]
  
    def index
        @teams = Team.all
    end

    def new
        @team = Team.new
    end

    def create 
        team = Team.new(team_params)
        if(team.save)
            redirect_to :action => :index
        else    
            render :action => :new  
            flash.alert = 'Could not create team'
        end
    end

    def destroy
        @team = Team.find params[:id]
        @team.users.delete_all
        @team.destroy
        redirect_to teams_path
        flash.alert = "deleted team"
    end

    def update
        Team.update(params[:id], team_params)
        redirect_to teams_path
    end

    def show 
        @teams = Team.all
        @team = Team.find(params[:id])
    end

    private

    def team_params
        params.require(:team).permit(:name, :logo)
    end

    def isManager?
        redirect_to teams_path, alert: "Permissions denied" unless
        current_user.manager?
    end
      
    def isAdmin?
        redirect_to teams_path, alert: "Permissions denied" unless
        current_user.admin?
    end
    
    
end
