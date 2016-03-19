class PetitionsController < ApplicationController
  before_action :authorize, only: [:new, :create]

  def index
    @petitions = Petition.all
    @petitions = @petitions.where(user: current_user) if params[:my]
  end

  def show
    @petition = Petition.find(params[:id])
  end

  def edit
    @petition = current_user.petitions.find(params[:id])
  end

  def update
    petition = current_user.petitions.find(params[:id])
    petition.update(petition_params)
    flash["alert-success"] = 'Петиция обновлена'
    redirect_to petition
  end

  def create
    petition = current_user.petitions.create(petition_params)
    redirect_to petition
  end

  def new
    @petition = Petition.new
  end

  def destroy
    petition = current_user.petitions.find(params[:id])
    petition.destroy
    flash["alert-success"] = 'Петиция удалена'
    redirect_to petitions_path
  end

  private

  def petition_params
    params.require(:petition).permit(:title, :text)
  end
end

