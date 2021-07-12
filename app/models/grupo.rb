class Grupo < ApplicationRecord
    has_many :tarefas, dependent: :destroy
    
    validates_presence_of :nome
    validates_length_of :nome, maximum: 50, allow_blank: true

    default_scope { where(removido: nil) }
end
