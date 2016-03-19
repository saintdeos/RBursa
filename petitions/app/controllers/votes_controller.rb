class VotesController < ApplicationController
  before_filter :authorize

  def create
    vote = current_user.votes.create(permitted_params)
    flash["alert-success"] = 'Спасибо! Ваш голос учтен'
    redirect_to vote.petition
  end

  def permitted_params
    params.permit(:petition_id)
  end
end
