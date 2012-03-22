class FriendsController < ApplicationController
  def index
   @event = Event.find(params[:id])
  end

  def search
  end
end
