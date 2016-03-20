class PetitionsController < ApplicationController
  before_action :authorize, only: [:new, :create]

  def index
    @petitions = Petition.all
    @petitions = @petitions.where(user: current_user) if params[:my]
  end

  def show
    @petitions = Petition.find(params[:id])
  end

  def edit
    petition = Petition.find(params[:id])
  end

  def update
    petition = Petition.find(params[:id])
    if petition.update(petition_params)
      redirect_to petition_path
    else
      render 'edit'
    end
  end

  def create
    petition = Petition.create(petition_params.merge({user_id: current_user.id}))
    if petition.save
      redirect_to petition_path(petition)
    else
      render 'new'
    end
  end

  def new
    @petitions = Petition.new
  end

  def destroy
    petition = Petition.find(params[:id])
    petition.destroy
    flash["alert-success"] = 'Петиция удалена'
    redirect_to petitions_path
  end

  private

  def petition_params
    params.require(:petition).permit(:title, :text)
  end
end

