class Admin::InstructorsController < Admin::ApplicationController
  
  def index
    all_instructors
  end
  
  def new
    new_instructor
  end

  def create
    if new_instructor(instructor_params).save
      redirect_to admin_instructors_path
    else
      render :new
    end
  end
  
  def edit
    instructor
  end
  
  def update
    if instructor.update_attributes(instructor_params)
      redirect_to admin_instructors_path
    else
      render :edit
    end
  end

private

  def all_instructors
    @instructors ||= Instructor.all
  end
  
  def new_instructor(attrs={})
    @instructor ||= Instructor.new(attrs)
  end
  
  def instructor
    @instructor ||= Instructor.find(params[:id])
  end
  
  def instructor_params
    params.require(:instructor).permit(:name)
  end
end
