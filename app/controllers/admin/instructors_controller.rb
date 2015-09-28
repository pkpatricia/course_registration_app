class Admin::InstructorsController < Admin::ApplicationController
  def index
    all_instructors
  end
  

private

  def all_instructors
    @instructors ||= Instructor.all
  end
end
