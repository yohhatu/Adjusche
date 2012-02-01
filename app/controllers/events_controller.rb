# -*- encoding: UTF-8 -*-

class EventsController < ApplicationController
	def index
		# 全件取得。検索条件はdummy
		@events = Event.where(["id > ?", 0 ])
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
