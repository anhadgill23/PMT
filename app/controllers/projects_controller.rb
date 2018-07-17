class ProjectsController < ApplicationController

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new        
    end

    def create 
        project = Project.new(project_params)
        if(project.save)
            redirect_to :action => :index
        else    
            render :action => :new  
            flash.alert = 'Could not create team'
        end
    end

    private

    def project_params
        params.require(:project).permit(:name, :logo)
    end
end
