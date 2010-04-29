class SessionsController < ApplicationController
	layout "admin"

	def create
		@User = User.find(:first, :conditions => ['email = ? AND senha = ?', params[:email], params[:senha]])

		if @User
			session[:logged] = true
			session[:login] = @User.email
			redirect_to emails_path
		else
			flash[:msg] = "Usuário e/ou senha inválidos."
			render :action => "new"
		end
	end

	def destroy
		session[:logged] = false
		redirect_to new_session_path
  end

end
