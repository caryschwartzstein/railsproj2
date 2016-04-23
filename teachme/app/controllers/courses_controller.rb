class CoursesController < ApplicationController
	def index
		if user_signed_in? == false
			redirect_to new_user_session_path
		else
			@courses = Course.all
		end
		# @courses = Course.all
	end

	def show
		@course = Course.find(params[:id])
	end

	def schedule
		@courses = current_user.courses
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
		@course.save
		redirect_to action: 'index'
	end

	def course_params
		params.require(:course).permit(:title)
	end

	def join
		if current_user.courses.include? Course.find(params[:id])
			flash[:alert] = "You have already joined this course"
			redirect_to action: 'index'
			return
		end
		@course = Course.find(params[:id])
		@course.users << current_user
		current_user.courses << @course
		redirect_to action: 'index'
	end

end
