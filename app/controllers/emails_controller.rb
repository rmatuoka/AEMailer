class EmailsController < ApplicationController
    before_filter :autentica
    
   layout "admin"
	
	def index
		@Emails = Email.find(:all)
	end

	def show
		@Email = Email.find(params[:id])
	end
	
	def new
		@Email = Email.new
	end

	def create
		@Email = Email.create(params[:email])
		
		if @Email.save
			redirect_to emails_path
		else
			flash[:msg] = "Erro ao inserir os dados. Verifique os erros."
			render :action => "new"
		end
	end

	def edit
		@Email = Email.find(params[:id])
	end
	
	def update
		@Email = Email.find(params[:id])
		@Email.attributes = params[:email]
		
		if @Email.save
			redirect_to emails_path
		else
			flash[:msg] = "Erro ao atualizar os, verifique os erros."
			render :action => "edit"
		end
	end

	def destroy
		@Email = Email.find(params[:id])
		
		if @Email.destroy
			redirect_to emails_path
		end
  end

  def autentica
    if session[:logged]
      true
    else
      redirect_to new_session_path
    end
  end    
end
