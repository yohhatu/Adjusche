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
			# 全件取得。検索条件はdummy
			@events = Event.where(["id > ?", 0 ])
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def create
		# DBにinsert
		@event = Event.create(params[:event])
		# イベント詳細画面に遷移
		redirect_to @event
	end
end
