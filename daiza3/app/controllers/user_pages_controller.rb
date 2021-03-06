# coding: utf-8
class UserPagesController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  def index
    if current_user
      @user = current_user
      @company_offers = CompanyOffer.where(mem_id: current_user)
      @company_offers.each do |company_offer|
        @companys = Company.where(id: company_offer.com_id)
      end
  elsif current_company
    @user = User.find(params[:id])
    end
    
  end

  def show
  end

  def new
  end

  def edit
  end
  
  def update
    company_offer = CompanyOffer.find(params[:id])
    company_offer.acc_flag = TRUE
    company_offer.save
    redirect_to user_pages_path, notice: "更新"
  end

   
end
