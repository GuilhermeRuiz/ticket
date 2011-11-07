class Comentario < ActiveRecord::Base
  belongs_to :chamado, :foreign_key => :id_chamado
  belongs_to :usuario
  
  validates :assunto, :presence => true
  validates :texto, :presence => true
  validates :id_usuario, :presence => true
  validates :id_chamado, :presence => true

end
