# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |n|
  @user = FactoryGirl.create(:user)
  @subject = FactoryGirl.create(:subject)
  @question = FactoryGirl.create(:question, user: @user, subject: @subject)
  3.times do |n|
    FactoryGirl.create(:option,question: @question)
  end
end
