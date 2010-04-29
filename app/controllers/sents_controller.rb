class SentsController < ApplicationController
    
    before_filter :autentica
    layout "admin"    

    def show
        @servidor = "http://localhost:3001"
        @TotalEmails = Sent.all(:conditions => ['sender_id = ?',params[:id]]).count
        @TotalEmailsEnviados = Sent.all(:conditions => ['sender_id = ? AND sent = 1',params[:id]]).count
        
        #PEGA OS 3 PRIMEIROS REGISTROS        
        @Sents = Sent.find(:all, :conditions => ['sender_id = ? AND sent = 0', params[:id]], :order => 'id DESC', :limit => 3 )
        
        if @Sents.blank?
          session[:total] = @TotalEmailsEnviados
          redirect_to success_sent_path(params[:id])
        end
        
        @Sender = Sender.find(params[:id])

        #ENVIA EMAIL PARA OS 3 E SETA FLAG DE ENVIADO
        @Sents.each do |s|
            #LE O CONTATO
            @Contact = Contact.find(:first, :conditions => ['id = ?',s.contact_id.to_i])
            
            #LE O MODELO DE EMAIL
            @Email = Email.find(:first, :conditions => ['id = ?', @Sender.email_id])
            
            
            #VERIFICA QUE TIPO DE EMAIL O USUARIO ESTA ENVIANDO
            if @Email.html.blank? 
              #MODELO PADRAO
              
              @corpo = "<table width='100%' height='100%' cellpadding='0' cellspacing='0' border='0'>
                      <tr>
                      <td align='center' valign='middle' bgcolor='#{@Email.bgcolor}'>
                        <a href='#{@Email.link}' target='_blank'><img src='#{@servidor}#{@Email.image.url}' border='0' /></a>
                      </td>
                      </tr>
                      </table>"

            else
              #MODELO HTML
              @corpo = @Email.html.to_s
            end
            
            #INSERE CONTROLE DE LEITURAS
            @corpo = @corpo + "<img src='#{@servidor}/sents/#{s.id.to_s}/read' style='visible:hidden;'>"
            
            #INSERE CASO NAO CONSIGA VISUALIZAR
            @corpo = @corpo + "<p align='center'><a href='#{@servidor}/views/#{@Email.id.to_s}' target='_blank'><font color='#666666' size='2' color='#CCCCCC'>Caso não consiga visualizar este email, clique aqui</font></a><p>"
            
            if Newsletter.deliver_enviar(@corpo.to_s,@Sender.subject, @Contact.email)
                  #Enviou
                  s.sent = 1
              end
            s.save
        end
    end
    
    def read
        @Sent = Sent.find(params[:id])
        @Sent.readed = 1
        @Sent.save
    end
    
    def sucess
        
    end
    
    def autentica
        if session[:logged]
          true
        else
          redirect_to new_session_path
        end
    end

end
