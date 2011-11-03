class ComentariosController < ConteudoRestrito
  
  before_filter :verificar_usuario, :only => :destroy
  
  def create
    @chamado               = Chamado.find(session[:id_chamado_visualizando])
    @comentario            = Comentario.new(params[:comentario])
    @comentario.id_usuario = usuario_atual.id
    @comentario.id_chamado = @chamado.id
    
    if @comentario.save
      flash[:success] = "Comantario publicado com sucesso!"
      redirect_to @chamado
    else
      flash[:error] = "Nao foi possivel publicar o comentario."
      redirect_to @chamado
    end
  end
  
  def destroy
    @chamado = Chamado.find(session[:id_chamado_visualizando])
    Comentario.find(params[:id]).destroy
    flash[:success] = "Comentario removido."
    redirect_to @chamado
  end
  
  private
  
    def verificar_usuario
      @chamado    = Chamado.find(session[:id_chamado_visualizando])
      @comentario = Comentario.find(params[:id])
      if !(usuario_atual.id.to_s == @comentario.id_usuario.to_s || usuario_atual.administrador? )
        redirect_to @chamado
      end
    end

end
