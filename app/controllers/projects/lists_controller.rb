class Projects::ListsController < ApplicationController
  before_action :set_project
  def new
    @list = @project.lists.new
  end


  private
  def set_project
    @project = Project.find(params[:project_id])
  end
end
