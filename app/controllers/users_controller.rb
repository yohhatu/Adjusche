# -*- encoding: UTF-8 -*-
class UsersController < ApplicationController

  def index
    @user = User.new
    @hoge = "おはようございます"
  end

  def menu
    @user = User.new
    
  end
end
