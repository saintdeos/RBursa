class UserMailer < ApplicationMailer

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

    def votes_time_expired(petition, votes)
    @petition = petition
    @user = petition.user
    @votes = votes
    mail to: @user.email, subject: 'Петиция не набрала голоса'
  end
end
