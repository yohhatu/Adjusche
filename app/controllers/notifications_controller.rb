class NotificationsController < ApplicationController
  def index 
    @user = session[:user_info].user_name
    @notifications = Notification.where(:user_id => 1 , :read_flag => false)

    @notifications.each do |notify|
      if notify.read_flag == false then
        #通知のカインドをキーに、メッセージをセレクトする
        case notify.notify_kind
        when "2" then
          str = Message.plain("MSG_NOTIFY_INVITATION", ["hoge","piyo"])
          @message = str
        else
        end
      end
    end

  end
end
