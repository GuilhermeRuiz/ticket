class SessionsController < ApplicationController
  def new
    @title = "Entrar"
  end
  
  def create
    usuario = Usuario.autenticar(params[:session][:email],params[:session][:senha])
    
    if usuario.nil?
      flash.now[:error] = "E-mail ou senha invalidos."
      @title = "Entrar"
      render 'new'
    else
      logar usuario
      redirect_back_or usuario
    end
  end
  
  def destroy
    sair
    redirect_to root_path
  end

end
