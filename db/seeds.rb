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

3.times do |n|
  User.create(:user_name => names[n], :user_pass => passes[n])
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
