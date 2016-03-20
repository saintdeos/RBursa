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
    mail to: @user.email, subject: 'Ваша петиция набрала голоса'
  end

  def admin_votes_recruited(petition, votes)
    @petition = petition
    @user = petition.user
    @votes = votes
    mail to: 'admin@petitions.kh.ua', subject: 'Петиция набрала голоса'
  end
end
