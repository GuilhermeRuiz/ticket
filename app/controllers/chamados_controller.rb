class ChamadosController < ConteudoRestrito
  
  before_filter :verificar_usuario_criador , :only => [:edit, :update, :destroy]
  
  def new
    @titulo   = "Cadastrar chamado"
    @usuarios = Usuario.all
    @chamado  = Chamado.new
  end
  
  def create
    @chamado                    = Chamado.new(params[:chamado])
    @chamado.id_usuario_criador = usuario_atual.id
    @chamado.id_status          = status_padrao.id
    
    if @chamado.save
      flash[:success] = "Ticket cadastrado com sucesso!"
      redirect_to @chamado
    else
      @title = "Cadastrar"
      render 'new'
    end
  end
  
  def show
    @titulo              = "Visualisando chamado"
    @chamado             = Chamado.find(params[:id])
    @status              = Status.find(@chamado.id_status)
    @usuario_criador     = Usuario.find(@chamado.id_usuario_criador)
    @usuario_responsavel = Usuario.find(@chamado.id_usuario_responsavel)
    @comentarios         = Comentario.paginate(:page => params[:page]).where(:id_chamado => @chamado.id)
    @comentario          = Comentario.new
    
    session[:id_chamado_visualizando] = @chamado.id
  end
  
  def edit
    @titulo   = "Editar chamado"
    @chamado  = Chamado.find(params[:id])
    @usuarios = Usuario.all
    @status   = Status.all
  end
  
  def update
    @chamado = Chamado.find(params[:id])
    if @chamado.update_attributes(params[:chamado])
      flash[:success] = "Chamado atualizado com sucesso!"
      redirect_to @chamado
    else
      @title = "Editar chamado"
      render 'edit'
    end
  end
  
  def index
    @chamados = Chamado.paginate(:page => params[:page])
    @titulo   = "Lista de chamados"
  end
  
  def destroy
    Chamado.find(params[:id]).destroy
    flash[:success] = "Chamado removido."
    redirect_to chamados_path
  end

  private
  
    def verificar_usuario_criador
      chamado = Chamado.find(params[:id])
      if !( ( usuario_atual.id.to_s == chamado.id_usuario_criador.to_s || usuario_atual.id.to_s == chamado.id_usuario_responsavel.to_s ) || usuario_atual.administrador? )
        flash[:error] = "Somente o usuario que criou o chamado pode edita-lo ou remove-lo."
        redirect_to(chamados_path)
      end
    end


end
