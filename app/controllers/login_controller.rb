class LoginController < ApplicationController

	def new

	end

	def create
		user = User.find_by_email(params[:email])
		
		if user && user.authenticate(params[:password])
			reset_session
			session[:user_id] = user.id
			message = { notice: "Olá, #{user.name}" }
			if user.admin?
				redirect_to admin_path, message	
			else
				redirect_to user_index_path, message
			end
		else
			flash[:alert] = "E-mail/senha inválidos."
			render :new
		end
	end
	
end