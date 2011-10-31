class UsuariosController < ApplicationController
  def new
    @titulo  = "Cadastre-se"
    @usuario = Usuario.new
  end
  
  def create
    @usuario = Usuario.new(params[:usuario])
    if @usuario.save
      #sign_in @user
      flash[:success] = "Usuario cadastrado com sucesso! Seja bem-vindo."
      redirect_to @usuario
    else
      @title = "Cadastrar"
      render 'new'
    end
  end
  
  def edit
    @usuario = Usuario.find(params[:id])
    @titulo  = "Editar usuario"
  end
  
  def show
    @usuario  = Usuario.find(params[:id])  
    @titulo   = @usuario.nome
  end
  
  def index
    @usuarios = Usuario.paginate(:page => params[:page])
    @titulo   = "Lista de usuarios"
  end
end
