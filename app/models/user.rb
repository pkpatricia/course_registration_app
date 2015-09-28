class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :enrollments
  has_many :courses, through: :enrollments
  
  def enrolled?(course)
    course.enrollments.select {|e| e.user == self }.any?
  end
end