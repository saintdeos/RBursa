class Petition < ActiveRecord::Base

  belongs_to :user
  has_many :votes

  DAYS_BEFORE_EXPIRE = 30.day.ago 

  def expired?(created_at)
  	created_at < DAYS_BEFORE_EXPIRE
  end

  def voted_by?(user)
    votes.where(user_id: user.id).any?
  end
end
