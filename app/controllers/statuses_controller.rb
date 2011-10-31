class StatusesController < ApplicationController
  def new
    @titulo = "Cadastrar status"
    @status = Status.new
  end
  
  def create
    @status = Status.new(params[:status])
    if @status.save
      #sign_in @user
      flash[:success] = "Status cadastrado com sucesso."
      redirect_to @status
    else
      @title = "Cadastrar status"
      render 'new'
    end
  end
  
  def show
    @status  = Status.find(params[:id])
    @titulo = "Visualizar status: "+@status.titulo
  end
  
  def edit
    @titulo = "Editar status"
    @status = Status.find(params[:id])
  end
  
  def update
    @status = Status.find(params[:id])
    if @status.update_attributes(params[:status])
      flash[:success] = "Status atualizado."
      redirect_to @status
    else
      @title = "Editar status"
      render 'edit'
    end
  end
end
