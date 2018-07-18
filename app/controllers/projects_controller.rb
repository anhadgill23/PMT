class ProjectsController < ApplicationController

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new        
    end

    def create 
        @project = Project.new(project_params)
        @project.team_id = params[:team_id]
        if(@project.save)
            redirect_to :action => :index
        else    
            render :action => :new  
            flash.alert = 'Could not create team'
        end
    end

    def show
        @projects = Projects.all
        @project = Project.find(params[:id])
    end

    private

    def project_params
        params.require(:project).permit(:name, :due_date, :logo)
    end
end
