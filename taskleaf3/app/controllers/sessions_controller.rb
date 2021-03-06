# coding: utf-8
class SessionsController < ApplicationController
  def new
  end

  def create
    user2 = User2.find_by(email: session_params[:email])

    if user2&.authenticate(session_params[:password])
      session[:user2_id] = user2.id
      redirect_to root_path,notice: 'ログインしました'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました'
  end
  
  private
  def session_params
    params.require(:session).permit(:email,:password)
  end
end
