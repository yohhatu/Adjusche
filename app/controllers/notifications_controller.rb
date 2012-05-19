# -*- encoding: utf-8 -*-
class NotificationsController < ApplicationController
  def index 
    @user = session[:user_info]
    @notifications = Notification.where(:user_id => @user.id , :read_flag => false)
  
 

    @msgAry = Array.new()
    @notifications.each do |notify|
      if notify.read_flag == false then
        #通知のカインドをキーに、メッセージをセレクトする
        case notify.notify_kind
        when "2" then
          @strUsrNm = User.find(@user.id)
          @strEvtNm = Event.find(notify.general_column2)
          str = Message.plain("MSG_NOTIFY_INVITATION", [@strUsrNm.user_name,@strEvtNm.name])
          @msgAry.push str
        else
        end
      end
    end

  end
end
