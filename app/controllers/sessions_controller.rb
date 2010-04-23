class SessionsController < ApplicationController
	layout "admin"
  
	def index
		@Users = User.find(:all)
	end

	def new
	  
	end

	def show

	end

	def create
		@User = User.find(:first, :conditions => ['email = ? AND senha = ?', params[:email], params[:senha]])

		if @User
			session[:logged] = true
			session[:login] = @User.email
			redirect_to noticias_path
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