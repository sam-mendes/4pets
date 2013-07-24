class LoginController < ApplicationController

	def new

	end

	def create
		user = User.find_by(email: params[:email])

		if authenticate? user
			
			define_session user
			
			options = if user.admin?
				[admin_path]
			else
				[user_index_path]
			end

			flash_message = { notice: "Olá, #{user.name}" }
			options << flash_message

			redirect_to(*options)
		else
			flash.now[:alert] = "E-mail/senha inválidos."
			render :new
		end
	end

	private 
	def authenticate?(user)
		user && user.authenticate(params[:password])
	end

	def define_session(user)
		reset_session
		session[:user_id] = user.id
	end
end