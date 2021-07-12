class Tarefa < ApplicationRecord
  belongs_to :grupo

  
  validates_presence_of :nome
  validates_length_of :nome, maximum: 200, allow_blank: true

  default_scope { where(removido: nil) }
end
