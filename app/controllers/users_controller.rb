# -*- encoding: UTF-8 -*-
class UsersController < ApplicationController

  def index
    @user = User.new
    @hoge = "おはようございます"
  end

  def login
    @user = User.new
    
  end

  def menu
    @user = User.new
    
  end

  def create
    login_user = params[ :u ]    
    
    begin
      User.find_by_user_name_and_user_pass!( params[:post][:name] , params[:post][:pass] )
 
      #User.find_by_user_name_and_user_pass!( "seit", "seit" ) 
    rescue ActiveRecord::RecordNotFound
      redirect_to :back
    end

    @events = Event.where(:user_id => 1) 
  end

end
