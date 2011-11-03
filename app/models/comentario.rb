class Comentario < ActiveRecord::Base
  belongs_to :chamado
  has_one :usuario
end
