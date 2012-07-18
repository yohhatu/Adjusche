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
		(params[:event])["user_id"] = luid
    # 登録用のハッシュに格納して登録
    strCandidateDate = (params[:event_candidate_date])["candidate_date"]
    @event = Event.create(params[:event])
    # この辺でサニタイジングする必要あるけどとりあえずなし
    # 改行区切りで配列に変換
    aryCandidateDate = strCandidateDate.split("\n") 
    aryCandidateDate.each{|date| 
      @event_candidate_date = EventCandidateDate.create(:event_id => @event.id,:candidate_date => date, :confirmed_flag => false)
    }
    #(params[:event])["description"] = aryCandidateDate.shift
		# DBにeventをinsert
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
