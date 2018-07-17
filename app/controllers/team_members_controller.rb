class TeamMembersController < ApplicationController
  def create
  end

  def destroy
  end

  private

    def member_params
        params.require(:team).permit(:name, :logo)
    end
end
