class Chamado < ActiveRecord::Base
  belongs_to :usuario, :foreign_key => :id_usuario_criador
  has_one :usuario, :foreign_key => :id_usuario_responsavel
  has_one :status, :foreign_key => :id_status
  has_many :comentario, :dependent => :destroy
end
