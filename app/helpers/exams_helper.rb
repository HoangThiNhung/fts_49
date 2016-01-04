module ExamsHelper
  def convert_time exam
    if exam.time_end - exam.time_start < exam.duration * 60
      time = exam.time_end - exam.time_start
    else
      time = exam.duration * 60
    end
    Time.at(time).utc.strftime "%H:%M:%S"
  end
end
