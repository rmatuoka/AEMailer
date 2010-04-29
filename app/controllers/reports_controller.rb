class ReportsController < ApplicationController
  before_filter :autentica
  
  layout "admin"
  
  def index
    @Reports = Report.find(:all)
  end

  def show
    @Report = Report.find(params[:id])
    
    if @Report.just_read > 0
       @JustRead = "Apenas e-mails lidos"
    else
       @JustRead = "Todos e-mails enviados"
    end
    
    #SELEECIONA TODOS SENDERS DA BASE GROUPS_SENDERS
    if @Report.date_start.blank? or @Report.date_end.blank?
        if @Report.just_read > 0
            @Sents = Sent.all(:conditions => ['sender_id = ? AND readed = ?', @Report.sender_id, @Report.readed])
        else
            @Sents = Sent.all(:conditions => ['sender_id = ?', @Report.sender_id])
        end
      
    else
        if @Report.just_read > 0
            @Sents = Sent.all(:conditions => ['sender_id = ? AND created_at >= ? AND created_at <= ? AND readed = ?', @Report.sender_id, @Report.date_start, @Report.date_end, @Report.just_read])
        else
            @Sents = Sent.all(:conditions => ['sender_id = ? AND created_at >= ? AND created_at <= ?', @Report.sender_id, @Report.date_start, @Report.date_end])
        end
        
    end

  end
  
  def new
    @Report = Report.new
  end

  def create
    @Report = Report.create(params[:report])
    
    if @Report.save
      redirect_to reports_path
    else
      flash[:msg] = "Erro ao inserir os dados. Verifique os erros."
      render :action => "new"
    end
  end

  def edit
    @Report = Report.find(params[:id])
  end
  
  def update
    @Report = Report.find(params[:id])
    @Report.attributes = params[:report]
    
    if @Report.save
      redirect_to reports_path
    else
      flash[:msg] = "Erro ao atualizar os, verifique os erros."
      render :action => "edit"
    end
  end

  def destroy
    @Report = Report.find(params[:id])
    
    if @Report.destroy
      redirect_to reports_path
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
