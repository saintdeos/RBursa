class UserMailer < ApplicationMailer
  def petition_create(petition)
    @petition = petition
    @user = petition.user
    mail to: @user.email, subject: 'Создана новая петиция'
  end

  def votes_recruited(petition, votes)
    @petition = petition
    @user = petition.user
    @votes = votes
    mail to: @user.email, subject: 'Петиция набрала голоса'
  end
end
