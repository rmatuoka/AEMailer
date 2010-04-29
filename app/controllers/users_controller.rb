class UsersController < ApplicationController
    
    before_filter :autentica
    layout "admin"
  
    def index
        @Users = User.find(:all)
    end

    def show
        @User = User.find(params[:id])
    end
  
    def new
        @User = User.new
    end

    def create
        @User = User.create(params[:user])
    
        if @User.save
            redirect_to users_path
        else
            flash[:msg] = "Erro ao inserir os dados. Verifique os erros."
            render :action => "new"
        end
    end

    def edit
        @User = User.find(params[:id])
    end
  
    def update
        @User = User.find(params[:id])
        @User.attributes = params[:users]
    
        if @User.save
            redirect_to users_path
        else
            flash[:msg] = "Erro ao atualizar os, verifique os erros."
            render :action => "edit"
        end
    end

    def destroy
        @User = User.find(params[:id])
      
        if @User.destroy
            redirect_to users_path
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
