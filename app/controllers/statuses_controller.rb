class StatusesController < ConteudoRestrito
  
  before_filter :verificar_administrador
  
  def new
    @titulo = "Cadastrar status"
    @status = Status.new
  end
  
  def create
    @status = Status.new(params[:status])
    if @status.save
      flash[:success] = "Status cadastrado com sucesso."
      redirect_to statuses_path
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
  
  def index
    @statuses = Status.paginate(:page => params[:page])
    @titulo   = "Lista de status"
  end
  
  def destroy
    Status.find(params[:id]).destroy
    flash[:success] = "Status removido."
    redirect_to statuses_path
  end
  
  private

    def verificar_administrador
      redirect_to(root_path) unless usuario_atual.administrador?
    end
  
end
