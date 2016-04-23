class CoursesController < ApplicationController
	def index
		@courses = Course.all
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new course_params
		@course.admins << current_user
		@course.users << current_user
		current_user.courses << @course
		current_user.admin_courses << @course
		# @course.users << current_user
		@course.save
		redirect_to action: 'index'
	end

	def course_params
		params.require(:course).permit(:title)
	end


end
