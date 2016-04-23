class CoursesController < ApplicationController
	def index
		# if !user_signed_in?
		# 	# render 'devise/sessions/form'
  #  			link_to "Login", new_user_session_path
		# else
		# 	@courses = Course.all
		# end
		@courses = Course.all
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
		@course = Course.find(params[:id])
		@course.users << current_user
		current_user.courses << @course
		redirect_to action: 'index'
	end

end
