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
    #login_user = params[ :u ]    
    
    begin
      login_user = User.find_by_user_name_and_user_pass!( params[:post][:name] , params[:post][:pass] ) 
    rescue ActiveRecord::RecordNotFound
      redirect_to :back
    end
    
    session[:user_info] = params[:post][:name]
    #@events = Event.where(:user_id => User.find_by_user_name(session[:user_info] )[:id]) 

    @user_name = login_user.user_name

    luid = login_user.id  
    @events = Event.where(:user_id => luid )

    #@events = Event.where(:user_id => 1)
  end

end
