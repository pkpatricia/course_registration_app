class Admin::EnrollmentsController < Admin::ApplicationController
  def index
    @enrollments = Enrollment.all
  end
end  