# encoding: UTF-8

class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to home_url
    else
      redirect_to login_url, :alert => "Неверное имя пользователя или пароль", 
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_url, :notice => 'Вы вышли из своего аккаунта'
  end

end
