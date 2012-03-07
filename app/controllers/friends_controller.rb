class FriendsController < ApplicationController
  $event_id
  def index
   $event_id = params[:id]
   @event = Event.find($event_id)

   @users = User.find_by_user_name('seit')
  end

  def search
    #@event = Event.find($event_id)
    @s_name = params[:search_name]

    # ユーーザー検索
    @users = User.find_by_user_name(@s_name)

    respond_to do |format|
      format.js
    end
    #render :index
  end
end
