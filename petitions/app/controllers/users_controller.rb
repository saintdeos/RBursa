class UsersController < ApplicationController

	def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
end