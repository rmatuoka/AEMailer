class SendersController < ApplicationController
    layout "admin"
	
	def index
		@Senders = Sender.find(:all)
	end

	def show
		@Sender = Sender.find(params[:id])
	end
	
	def new
		@Sender = Sender.new
	end

	def create
		@Sender = Sender.create(params[:sender])
		
		if @Sender.save
			redirect_to senders_path
		else
			flash[:msg] = "Erro ao inserir os dados. Verifique os erros."
			render :action => "new"
		end
	end

	def edit
		@Sender = Sender.find(params[:id])
	end
	
	def update
		@Sender = Sender.find(params[:id])
		@Sender.attributes = params[:group]
		
		if @Sender.save
			redirect_to senders_path
		else
			flash[:msg] = "Erro ao atualizar os, verifique os erros."
			render :action => "edit"
		end
	end

	def destroy
		@Sender = Sender.find(params[:id])
		
		if @Sender.destroy
			redirect_to senders_path
		end
	end

    def import_mails
        @Sender = Sender.find(params[:id])
        @AllGroups = GroupsSenders.find(:all, :conditions => ['sender_id = ? ', params[:id]])
        
        countErros = 0
        @AllGroups.each do |all|
            #FIND GRUPOS
            @Group = Group.find(:all, :conditions => ['id = ?', all.group_id.to_i])
            
            @Group.each do |g|
                @Contact = Contact.find(:all, :conditions => ['group_id = ?',g.id.to_i])
                
                @Contact.each do |c|
                    @Sent = Sent.new
                    @Sent.contact_id = c.id
                    @Sent.sent = 0
                    @Sent.sender_id = @Sender.id
                    
                    if !@Sent.save
                        countErros = countErros + 1
                    end
                end
            end
        end

        if countErros > 0
            mensagem = countErros.to_s + " contatos não foram importados."
        else
            mensagem = "Os contatos foram importados com sucesso. <br><br> Clique em enviar para iniciar o envio dos e-mails.<br><br>"
            mensagem = mensagem + "<a href='/sents/" + @Sender.id.to_s + "'>Enviar!</a>"
        end

        flash[:msg] = mensagem
    end
end
