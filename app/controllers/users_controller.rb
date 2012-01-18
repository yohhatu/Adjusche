# -*- encoding: UTF-8 -*-
class UsersController < ApplicationController

  def index
    @user = User.new
    @hoge = "おはようございます"
  end

  def login
    @user = User.new
    
  end

  def menu
    @user = User.new
    
  end

  def new
    @user = User.new
    
  end
end
