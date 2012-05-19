# -*- encoding: UTF-8 -*-
names = [
  "seit",
  "yohhatu",
  "f012",
  "test",
  "negoro"
]

passes = [
  "seit",
  "yohhatu",
  "f012",
  "test",
  "negoro"
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

notify_user_id = [
  1,
  1,
  1,
  1,
  1
]

notify_kinds = [
  "0",
  "1",
  "2",
  "1",
  "2"
]
read_flags = [
  true,
  true,
  true,
  false,
  false
]
general_column1s = [
 1,
 2,
 3,
 4,
 5
]
  
general_column2s = [
 1,
 2,
 3,
 4,
 5
]

5.times do |u|
  User.create(:user_name => names[u], :user_pass => passes[u])
end

5.times do |e|  
  Event.create(:name => event_names[e], :user_id => event_user_ids[e])
end

5.times do |n|
  Notification.create(:user_id => event_user_ids[n], :notify_kind => notify_kinds[n], :read_flag => read_flags[n], :general_column1 => general_column1s[n], :general_column2 => general_column2s[n], :notify_date => "20120519")
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
