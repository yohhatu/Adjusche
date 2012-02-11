# -*- encoding: UTF-8 -*-

class EventsController < ApplicationController
	def index
		# ユーザID取得
		luid = params[:user_id]
		@user_name = params[:user_name]

		if (luid != nil) then
			# ユーザIDを元に取得
			@events = Event.where(:user_id => luid )
		else
			# (dummy)全件取得
			@events = Event.all
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	# 新規作成画面
	def new
		@event = Event.new
	end

	def create
		# DBにinsert
		@event = Event.create(params[:event])
		# イベント詳細画面に遷移
		redirect_to @event
	end

	# 編集画面
	def edit
		@event = Event.find(params[:id])
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
