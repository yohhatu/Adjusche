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
		login_user = session[:user_info]
		login_user_id = login_user.id
		(params[:event])["user_id"] = login_user_id

    # event_create関数内で登録処理。モデルにて記述。
    str_candidate_date = (params[:event_candidate_date])["candidate_date"]
    @event = Event.event_create(params[:event], str_candidate_date)

    # この辺でサニタイジングする必要あるけどとりあえずなし

		redirect_to @event
	end

	### 編集画面
	def edit
    edit_event_id = params[:id]
		@event = Event.find(edit_event_id)

    @event_candidate_dates = EventCandidateDate.where(:event_id => edit_event_id)
    str_candidate_date = "" # イベント候補日を改行でつなげた文字列
    @event_candidate_dates.each{|event_candidate_date|
      str_candidate_date << event_candidate_date.candidate_date + "\r\n"
      logger.debug("seit event_candedate_date#{event_candidate_date.candidate_date}")
    }
    @candidate_date = str_candidate_date
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
