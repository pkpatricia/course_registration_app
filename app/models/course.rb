class Course < ActiveRecord::Base
  belongs_to :instructor
    
    has_many :enrollments
    has_many :users, through: :enrollments
    
    def instructor_name
      instructor && instructor.name
    end
end
