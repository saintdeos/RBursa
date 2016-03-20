namespace :votes do
  desc "Check time to life of petitions"
  task VotingEndingJob: :environment do
    petitions = Petition.where(expired: false)
    petitions.each do |p|
      votes = p.votes.count
      if p.expired?(p.created_at)
        p.update(expired: true)
        UserMailer.votes_time_expired(p, votes).deliver_now
      end
    end
  end
end
