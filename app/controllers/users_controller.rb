class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.active
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_url, notice: 'New User created'
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to root_url, notice: 'User updated'
		else
			render :edit
		end
	end

	def destroy
		if @role.destroy
			redirect_to root_url, notice: 'User destroyed'
		else
			redirect_to users_path
		end	
	end


	private

		def user_params
			params.require(:user).permit(:email, :first_name, :last_name, :pic, :role_ids => [])
		end

		def set_user
			@user = User.find_by_id params[:id]
		end

end
