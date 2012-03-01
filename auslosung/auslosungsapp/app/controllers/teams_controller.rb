class TeamsController < ApplicationController
  def show
   @team = Team.find(params[:id])
  end
  
  def new
    @team = Team.new
  end
  
  def create
    @team = Team.new(params[:team])
    if @team.save
       flash[:success] = "New Team successfully added!"
       redirect_to @team
    else
      render 'new'
    end
  end
end
