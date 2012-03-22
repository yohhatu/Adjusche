class FriendsController < ApplicationController
  $event_id
  def index
   $event_id = params[:id]
   #選択されたイベントidをセッションに保持
   session[:EVENT_ID] = $event_id
   @event = Event.find($event_id)

   #@friends = User.where(:user_name=>'seit')
  end

  def search
    #@event = Event.find($event_id)
    @s_name = params[:search_name]

    # ユーザー検索(部分一致)
    #@friends = User.where(:user_name => @s_name)
    @friends = User.find(:all,:conditions => [ "user_name LIKE?", "%#@s_name%"])

    respond_to do |format|
      format.js
    end
    #render :index
  end

  def create
    @id = params[:id]
    if EventUser.where(:event_id=>session[:EVENT_ID],:user_id=>@id).count == 0
      EventUser.create(:event_id=>session[:EVENT_ID], :user_id=>@id,:condition=>'1')
    else
      #すでに招待済ですなどのメッセージ必要
    end
  end
end
