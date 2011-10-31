class ChamadosController < ApplicationController
  def new
    @titulo  = "Cadastrar chamado"
    @chamado = Chamado.new
  end

end
