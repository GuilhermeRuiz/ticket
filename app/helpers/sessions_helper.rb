module SessionsHelper
  
  def autenticar
    negar_acesso unless logado?
  end
  
  def usuario_correto
    @usuario = Usuario.find(params[:id])
    redirect_to(root_path) unless usuario_atual?(@usuario)
  end  
  
  def logar(usuario)
    cookies.permanent.signed[:remember_token] = [usuario.id, usuario.salt]
    usuario_atual= usuario
  end
  
  def usuario_atual=(usuario)
    @usuario_atual = usuario
  end
  
  def usuario_atual
    @usuario_atual ||= user_from_remember_token
  end
  
  def logado?
    !usuario_atual.nil?
  end
  
  def sair
    cookies.delete(:remember_token)
    @usuario_atual = nil
  end
  
  def negar_acesso
    store_location
    redirect_to entrar_path, :notice => "E necessario estar logado para visualizar o conteudo desta pagina."
  end
  
  def usuario_atual?(usuario)
    usuario == usuario_atual
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end
  
  private
    
    def user_from_remember_token
      Usuario.autenticar_com_salt(*remember_token)
    end
    
    def remember_token
      cookies.signed[:remember_token] || [nil,nil]
    end
    
    def store_location
      session[:return_to] = request.fullpath
    end
    
    def clear_return_to
      session[:return_to] = nil
    end
end
