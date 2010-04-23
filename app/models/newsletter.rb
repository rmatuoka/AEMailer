class Newsletter < ActionMailer::Base
  
    #se precisar os parametros são Email.deliver_padrao(corpo, "Assunto",email para&nbsp;&nbsp; #enviar(destino), email para resposta)
    def enviar(corpo, assunto, email = "rmatuoka@agenciaeconomica.com.br",responder = "rmatuoka@agenciaeconomica.com.br")
        recipients email
        from "TESTE <rmatuoka@agenciaeconomica.com.br>"
        subject assunto
        reply_to responder
        body :corpo => corpo
    end

end
