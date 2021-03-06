class UsersController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update]
	before_action :correct_user,   only:   [:edit, :update]

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@memberships = Membership.where("user_id = #{current_user.id} OR host = #{current_user.id}")
		redirect_to root_path unless current_user 
	end

	def new
		@user = User.new
		redirect_to user_path(current_user) if current_user
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)

		if @user.save 
			log_in @user 
			flash[:success] = "Welcome to LearntoCode.tech!"
			redirect_to @user 
		else
			render 'new'
		end
	end

	def update
		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		user = User.find(params[:id]).destroy
		unless current_user? user 
			user.destroy
			flash[:success] = "User deleted."
		end
		redirect_to users_url
	end


	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	 def signed_in_user
	 	unless user_signed_in?
	 		flash[:danger] = "Please log in."
	 		redirect_to login_url
	 	end
	 end

	 def correct_user
	 	@user = User.find(params[:id])
	 	redirect_to(root_url) unless current_user?(@user)
	 end
end
