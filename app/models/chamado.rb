class Chamado < ActiveRecord::Base
  belongs_to :usuario, :foreign_key => :id_usuario_criador
  has_one :usuario, :foreign_key => :id_usuario_responsavel
  has_one :status, :foreign_key => :id_status
  has_many :comentarios, :foreign_key => :id_chamado, :dependent => :destroy
  
  validates :titulo, :presence => true
  validates :descricao, :presence => true
  validates :id_status, :presence => true
  validates :id_usuario_criador, :presence => true
  validates :id_usuario_responsavel, :presence => true
end
