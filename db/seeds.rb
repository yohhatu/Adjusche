# -*- encoding: UTF-8 -*-
names = [
  "seit",
  "yohhatu",
  "f012"
]

passes = [
  "seit",
  "yohhatu",
  "f012"
]

event_names = [
  "焼き肉パーティー",
  "部門間飲み会",
  "ゴルフコンペ",
  "Ruby勉強会",
  "RxT Study"
]

event_user_ids = [
  1,
  2,
  1,
  3,
  1
]

3.times do |n|
  User.create(:user_name => names[n], :user_pass => passes[n])
end

5.times do |e|  
  Event.create(:name => event_names[e], :user_id => event_user_ids[e])
end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
