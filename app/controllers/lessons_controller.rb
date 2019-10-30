class LessonsController < ApplicationController
      before_action :authenticate_user!
      before_action :check_enrollment
  

  def show
  end

  private


  def check_enrollment
    if current_user.enrolled_in?(current_lesson.section.course) 
    else
      redirect_to course_path(current_lesson.section.course), alert: 'You are not Enrolled in this Course'
    end
  end 

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
