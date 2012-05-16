# -*- encoding: utf-8 -*-
class LoginsController < ApplicationController
  def index
    render :layout => false
  end

  def login
    begin
      login_user = User.find_by_user_name_and_user_pass!( params[:post][:name] , params[:post][:pass] )
    rescue ActiveRecord::RecordNotFound
      #redirect_to :controller => "logins", :action => "index"
      redirect_to :back
    end

    session[:user_info] = login_user
    #@events = Event.where(:user_id => User.find_by_user_name(session[:user_info] )[:id])

    @user_name = login_user.user_name

    luid = login_user.id
    @events = Event.where(:user_id => luid )

    redirect_to :controller => "events", :action => "index"
  end
end
