# -*- encoding: utf-8 -*-
class ApplicationController < ActionController::Base

  protect_from_forgery

  #セッションidを定義
  EVENT_ID = "event_id"
  USER_INFO = "user_info"
  
  def bar_controller
    event_users = EventUser.where(:user_id=>session[:user_info].id, :condition=>"1")
  
    @notify = "おしらせ:" + event_users.count.to_s
  end
end
