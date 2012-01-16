class UsersController < ApplicationController

  def index
    @user = User.new
    @hoge = "おはよう"
  end

  def login
    @user = User.new
    
  end

end
