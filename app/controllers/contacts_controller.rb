class ContactsController < ApplicationController
	before_filter :load_group
	layout "admin"
	
	def index
		@Contacts = @Group.contacts.find(:all)
	end

	def show
		@Contact = @Group.contacts.find(params[:id])
	end
	
	def new
		@Contact = @Group.contacts.build
	end

	def create        
        flash[:msg] = "";
        #PEGA EMAILS        
        mails = params[:contact][:email]

		    #GRAVA CADA CONTATO SEPARADO POR VIRGULA
        mails.split(',').each do |e|
            @Contact = @Group.contacts.create(params[:contact])    		
            @Contact.email = e
            @Contact.save
		    end

        redirect_to group_contacts_path
	end

	def edit
		@Contact = @Group.contacts.find(params[:id])
	end
	
	def update
		@Contact = @Group.contacts.find(params[:id])
		@Contact.attributes = params[:contact]
	
		if @Contact.save
			redirect_to group_contacts_path
		else
			flash[:msg] = "Erro ao atualizar os, verifique os erros."
			render :action => "edit"
		end
	end

	def destroy
		@Contact = @Group.contacts.find(params[:id])
		
		if @Contact.destroy
			redirect_to group_contacts_path
		end
	end

	def load_group
    if session[:logged]
      true
    else
      redirect_to new_session_path
    end
    
		@Group = Group.find(params[:group_id])		
	end
end
