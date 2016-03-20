class VotesController < ApplicationController
  before_filter :authorize

  def create
    vote = current_user.votes.create(permitted_params)
    votes = Vote.where(permitted_params).count
    if votes >= Vote::VOTES
      petition = vote.petition
      UserMailer.votes_recruited(petition, votes).deliver_now
      UserMailer.admin_votes_recruited(petition, votes).deliver_now
    end
    flash["alert-success"] = 'Спасибо! Ваш голос учтен'
    redirect_to vote.petition
  end

  def permitted_params
    params.permit(:petition_id)
  end
end
