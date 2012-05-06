class NotificationsController < ApplicationController
  def index 
    @user = session[:user_info].user_name
    @notifications = Notification.where(:user_id => 1 , :read_flag => false)

    @notifications.each do |notify|
      if notify.read_flag == 0 then
        #通知のカインドをキーに、メッセージをデータベースから取得してくる
      end
    end

  end
end
