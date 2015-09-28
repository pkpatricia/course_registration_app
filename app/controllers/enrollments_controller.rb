class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    redirect_to course and return if current_user.enrolled?(course)
    @enrollment = course.enrollments.new(enrollment_params)
    
    @enrollment.user = current_user
    if @enrollment.save
      redirect_to course, notice: 'Enrollment was successfully created.'
    else
      render :new
    end
  end


  private
    
    def course
      @course ||= Course.find(params[:course_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.permit()
    end
end
