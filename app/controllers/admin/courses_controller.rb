class Admin::CoursesController < Admin::ApplicationController
  
  def index
    all_courses
  end
  
  def new
    new_course
  end

  def create
    if new_course(course_params).save
      redirect_to admin_courses_path
    else
      render :new
    end
  end
  
  def edit
    course
  end
  
  def update
    if course.update_attributes(course_params)
      redirect_to admin_courses_path
    else
      render :edit
    end
  end

private

  def all_courses
    @courses ||= Course.all
  end
  
  def new_course(attrs={})
    @course ||= Course.new(attrs)
  end
  
  def course
    @course ||= Course.find(params[:id])
  end
  
  def course_params
    params.require(:course).permit(:name, :description, :instructor_id, :location)
  end
end
