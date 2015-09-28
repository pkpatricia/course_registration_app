class Instructor < ActiveRecord::Base
  has_many :courses
  
  def course_names
    courses.map {|course| course.name }.join(", ")
  end
end
