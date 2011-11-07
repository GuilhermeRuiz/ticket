class UsuariosController < ConteudoRestrito
  
  #Sobrescrevendo o before_filter de ConteudoRestrito. Assim, somente a pagina de cadastro ficara acessivel.
  before_filter :autenticar, :except => [:new,:create]
  
  def new
    @titulo  = "Cadastre-se"
    @usuario = Usuario.new
  end
  
  def create
    @usuario = Usuario.new(params[:usuario])
    if @usuario.save
      logar @usuario
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
  
  def update
    @usuario = Usuario.find(params[:id])
    if @usuario.update_attributes(params[:usuario])
      flash[:success] = "Usuario atualizado com sucesso!"
      redirect_to @usuario
    else
      @title = "Editar usuario"
      render 'edit'
    end
  end
  
  def show
    @usuario             = Usuario.find(params[:id])
    @titulo              = "Chamados criados por #{@usuario.nome}"
    
    if @usuario == @usuario_atual
      @titulo            = "Meus chamados"
    end
    
    @chamados_criados    = Chamado.paginate(:page => params[:page]).where(:id_usuario_criador => params[:id])
    comentarios          = @usuario.comentarios
    @chamados_comentados = Chamado.paginate(:page => params[:page], :select => "DISTINCT chamados.*" ,:joins => "INNER JOIN comentarios ON chamados.id = comentarios.id_chamado" , :conditions => " comentarios.id IN  (#{comentarios.map(&:id).join( ", " )})")
    
  end
  
  def index
    @usuarios = Usuario.paginate(:page => params[:page])
    @titulo   = "Lista de usuarios"
  end
  
  def destroy
    Usuario.find(params[:id]).destroy
    flash[:success] = "Usuario removido."
    redirect_to usuario_path
  end
  
  private
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
end
