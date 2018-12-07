# coding: utf-8
class UsersController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
        redirect_to users_path, notice:"登録完了"
    else
      render :new
    end
  end
  
  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update!(user_params)
    redirect_to user_pages_path, notice: "更新完了"
  end
  
  def show
  end

  def index
  end
  
  private
  def user_params
  params.require(:user).permit(:mem_id, :mem_name, :user_name, :mem_info, :mem_birth, :mem_gra, :des_occupation, :des_location, :password, :password_confirmation, :pic, :univercity, :circle, :labo, :study, :deliver, :activity, :qualification, :lang_ex, :system_ex, :flame_ex)
  end
end
