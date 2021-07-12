json.data @grupos do |grupo|
    json.id                                         grupo.id
    json.nome                                       grupo.nome
    json.quantidade_tarefas                         grupo.tarefas.size
    json.quantidade_tarefas_por_dia_no_mes          tarefas_por_dia(grupo.created_at, grupo)
    json.quantidade_tarefas_por_periodo_no_mes      quantidade_tarefas_periodo(grupo)
    json.quantidade_tarefas_removidas_periodo_mes   quantidade_tarefas_removidas_periodo(grupo)
end