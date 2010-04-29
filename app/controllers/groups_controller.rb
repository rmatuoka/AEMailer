class GroupsController < ApplicationController
	before_filter :autentica
  
  layout "admin"
	
	def index
		@Groups = Group.find(:all)
	end

	def show
		@Group = Group.find(params[:id])
	end
	
	def new
		@Group = Group.new
	end

	def create
		@Group = Group.create(params[:group])
		
		if @Group.save
			redirect_to groups_path
		else
			flash[:msg] = "Erro ao inserir os dados. Verifique os erros."
			render :action => "new"
		end
	end

	def edit
		@Group = Group.find(params[:id])
	end
	
	def update
		@Group = Group.find(params[:id])
		@Group.attributes = params[:group]
		
		if @Group.save
			redirect_to groups_path
		else
			flash[:msg] = "Erro ao atualizar os, verifique os erros."
			render :action => "edit"
		end
	end

	def destroy
		@Group = Group.find(params[:id])
		
		if @Group.destroy
			redirect_to groups_path
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
