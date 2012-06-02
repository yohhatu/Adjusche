# -*- encoding: UTF-8 -*-

class EventsController < ApplicationController
	### メニュー画面
	def index
    #お知らせを表示するメソッドを呼び出し
    bar_controller()

		# ユーザID取得
		login_user = session[:user_info]
		luid = login_user.id
		@user_name = login_user.user_name
		if (luid != nil) then
			# ユーザIDを元にイベントを取得
			@events = Event.where(:user_id => luid )
		else
			# (dummy)全件取得
			@events = Event.all
		end

	end

	### 詳細画面
	def show
		@event = Event.find(params[:id])
		# 作成ユーザ名取得
		user = User.find(@event.user_id)
		@user_name = user.user_name
	end

	### 新規作成画面
	def new
	  @event = Event.new
    @candidate_date = "例)8/6(金)"
	end

	def create
		# ログインユーザIDを取得
		login_user = session[:user_info]
		luid = login_user.id
		# 作成ユーザIDを設定
		(params[:event])["user_id"] = luid
    # 登録用のハッシュに格納して登録
    strName = (params[:event])["name"]
    strDescription = (params[:event])["description"]
    strUserId = (params[:event])["user_id"]
    strCandidateDate = (params[:event_candidate_date])["candidate_date"]
		# DBにeventをinsert
		#@event = Event.create(:name => strName, :description => strDescription, :user_id => strUserId)
    @event = Event.create(params[:event])
		# イベント詳細画面に遷移
		redirect_to @event
	end

	### 編集画面
	def edit
		@event = Event.find(params[:id])
    @candidate_date = "test"
	end

	def update
		@event = Event.find(params[:id])
		@event.update_attributes(params[:event])
		redirect_to @event
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to :events
	end
end
