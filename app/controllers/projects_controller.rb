class ProjectsController < ApplicationController
  before_action :set_project, except: [:index, :new, :create]

  def index
    @projects = Project.all
  end

  def show;end

  def new
    @project = Project.new
  end


  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to root_path,notice: "Project created!", status: :see_other
    else
      render :new, status: :unprocessable_entity, aler: "Could not save this project"
    end
  end

  def update
    if @project.update(project_params)
      redirect_to root_path,notice: "Project updated!", status: :see_other
    else
      render :edit, status: :unprocessable_entity, aler: "Could not save this project"
    end

  end

  def destroy
    if  @project.destroy
      redirect_to root_path, notice: "Project destroyed"
    else
      redirect_to root_path, alert: "Project not destroyed"

    end
  end


  private


  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
