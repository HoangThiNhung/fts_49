# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@admin = User.create!(name: "Framgia Vietnam", email: "admin@framgia.com",
  password: "123456", admin: true)

5.times do |n|
  @user = FactoryGirl.create(:user, admin: false)
  @subject = FactoryGirl.create(:subject)
  10.times do |n|
    @question = FactoryGirl.create(:question, user: @admin, subject: @subject)
    3.times do |n|
      FactoryGirl.create(:option, question: @question)
    end
    FactoryGirl.create(:option, question: @question, is_correct: true)
  end
end
