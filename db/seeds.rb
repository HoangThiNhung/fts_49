# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Subject.create!(name: "SQL")
User.create!(email: "locbinh@gmail.com", password: "locbinh93", password_confirmation: "locbinh93")
10.times do |n|
  Question.create!(content: "The question #{n}", status: "accepted",
    question_type: 1, user_id: User.first.id, subject_id: Subject.first.id)
end
Subject.create!(name: "Android")
