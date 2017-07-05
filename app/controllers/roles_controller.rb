class RolesController < ApplicationController

	before_action :set_role, only: [:show, :edit, :update, :destroy]

	def index
		@roles = Role.all
	end

	def new
		@role = Role.new
	end

	def create
		@role = Role.new(role_params)
		if @role.save
			redirect_to root_url, notice: 'New Role created'
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @role.update(role_params)
			redirect_to root_url, notice: 'Role updated'
		else
			render :edit
		end
	end

	def bulk_update
		@roles = Role.where("id in (?)", params[:role_ids])	
		if params[:role_ids]
  		@active_roles = Role.where.not("id in (?)", params[:role_ids])
		else
			@active_roles = Role.all
		end
		@roles.update_all(hidden: true)
		@active_roles.update_all(hidden: false)
		render json: {success: true}
	end

	def destroy
		if @role.destroy
			redirect_to roles_path, notice: 'Role destroyed'
		else
			redirect_to roles_path
		end	
	end

	private

		def role_params
			params.require(:role).permit(:role_name, :hidden)
		end

		def set_role
			@role = Role.find_by_id params[:id]
		end

end
