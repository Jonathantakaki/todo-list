json.data @tarefas do |tarefa|
    json.id         tarefa.id
    json.nome       tarefa.nome
    json.created_at tarefa.created_at
    json.concluido  tarefa.concluido
    json.tempo_decorrido tempo_decorrido(tarefa.concluido, tarefa.created_at)
    json.periodo_criacao periodo(tarefa.created_at)
end