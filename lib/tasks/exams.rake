namespace :exams do
  desc "Check exam every end of the month"
  task send_statistic_every_month: :environment do
    Exam.send_statistic_every_month
  end
end