class Projects::ListsController < ApplicationController
  before_action :set_project
  def new
    @list = @project.lists.new
  end

  def create
    @list = @project.lists.new(list_params)
    if @list.save
      redirect_to @project, notice: "List created!", status: :see_other
    else
      render :new, alert: "List not created!", status: :unprocessable_entity
    end
  end


  private
  def set_project
    @project = Project.find(params[:project_id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
