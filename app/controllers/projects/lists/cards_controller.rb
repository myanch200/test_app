class Projects::Lists::CardsController < ApplicationController
  before_action :set_project
  before_action :set_list

  def new
    @card = @list.cards.new
  end

  def create
    @card = @list.cards.new(card_params)
    if @card.save
      redirect_to project_path(@project), notice: "Card created!", status: :see_other
    else
      render :new, alert: "Card not created!", status: :unprocessable_entity
    end
  end

  private
  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_list
    @list = @project.lists.find(params[:list_id])
  end

  def card_params
    params.require(:card).permit(:name)
  end
end
