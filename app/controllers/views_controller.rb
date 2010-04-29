class ViewsController < ApplicationController
    def show
       @Email = Email.find(params[:id])
       
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
    end
end
