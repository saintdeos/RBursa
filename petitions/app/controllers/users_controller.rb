class UsersController < ApplicationController

	def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to root_url, notice: "Welcome!"
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
