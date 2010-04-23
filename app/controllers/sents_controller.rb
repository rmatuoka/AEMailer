class SentsController < ApplicationController
    layout "admin"    

    def show
        #PEGA OS 3 PRIMEIROS REGISTROS        
        @Sents = Sent.find(:all, :conditions => ['sender_id = ?', params[:id]], :order => 'id DESC', :limit => 3 )        

        #ENVIA EMAIL PARA OS 3 E SETA FLAG DE ENVIADO
        @Sents.each do |s|
            #VALIDA SE FOI ENVIADO OU NÃO
            @Contact = Contact.find(:first, :conditions => ['id = ?',s.contact_id.to_i])

            Newsletter.deliver_enviar(s.id.to_s,"aaa", @Contact.email)
        end
    end
end
