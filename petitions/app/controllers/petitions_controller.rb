class PetitionsController < ApplicationController

  def index
    if current_user.nil?
      @petitions = Petition.last(10)
    else
      @petitions = Petition.all
    end
  end

  def show
    @petitions = Petition.find(params[:id])
  end

  def update
    petition = Petition.find(params[:id])
    petition.update(params)
    redirect_to petition_path(article)
  end

  def create
    petition = Petition.create(petition_params.merge({user_id: current_user.id}))
    redirect_to petition_path(petition)
  end

  def new
    @petitions = Petition.new
  end

  private

  def petition_params
    params.require(:petition).permit(:title, :text)
  end
end
# @petitions = Petition.select{|p| p.user_id == current_user.id}
