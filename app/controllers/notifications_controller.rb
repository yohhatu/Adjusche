# -*- encoding: utf-8 -*-
class NotificationsController < ApplicationController
  def index 
    @user = session[:user_info]
    @notifications = Notification.where(:user_id => @user.id , :read_flag => false) 

    @msgAry = Array.new()
    @notifications.each do |notify|
      if notify.read_flag == false then
        h = Hash.new()
        # 通知のカインドをキーに、メッセージをセレクトする
        case notify.notify_kind
        when "2" then
          @addressUser = User.find(@user.id)
          @event = Event.find(notify.general_column2)
          h.store('msg', Message.plain("MSG_NOTIFY_INVITATION", [@addressUser.user_name,@event.name]))
          h.store('date', Date.strptime(notify.notify_date, "%Y%m%d"))
          @msgAry.push h
        else
        end
      end
    end

  end
end
