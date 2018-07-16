class TeamsController < ApplicationController
    before_action :isManager?, only: [:create, :new]
    before_action :isAdmin?, only: [:destroy]
  
    def new
        @team = Team.new
    end

    def index
    end

    def create 
        @team = Team.new(params[:team_params])
        if(@team.save)
            #Saved successfully; go to the index (or wherever)...
            redirect_to :action => :index
        else    
            #Validation failed; show the "new" form again...
            render :action => :new  
        end

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
