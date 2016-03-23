class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.auth(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash["alert-success"] = "Добро Пожаловать #{user.first_name}"
      redirect_to root_url
    else
      flash["alert-danger"] = "Неверный email или пароль"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash["alert-success"] = "Пока-пока"
    redirect_to root_url
  end
end
