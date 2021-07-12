module TarefasFormat
    require 'date'

    def tempo_decorrido(conclusao, inicio)
        ((conclusao - inicio)  / 3600).round(2) if conclusao
    end

    def periodo(date)
        horario = date.hour
        if horario >= 0 && horario < 12
            'Manhã'
        elsif horario >= 12 && horario < 18
            'Tarde'
        else
            'Noite'
        end
    end

    def tarefas_por_dia(data, grupo)
        dias = Month.new(data.year, data.month).length
        tarefas_dia = {}
        (1..dias).each do |dia|
            cont = 0
            grupo.tarefas.each do |tarefa|
                mes_corrente = DateTime.current.to_date.month
                if mes_corrente == tarefa.created_at.month
                    cont = cont + 1 if tarefa.created_at.day == dia
                end
            end
            tarefas_dia[dia] = cont
         end
         tarefas_dia
    end

    def quantidade_tarefas_periodo(grupo)
        qnt_tarefas_periodo(grupo.tarefas)
    end

    def quantidade_tarefas_removidas_periodo(grupo)
        qnt_tarefas_periodo(grupo.tarefas.unscoped.where.not(removido: nil))
    end

    def qnt_tarefas_periodo(tarefas)
        contManha = 0
        contTarde = 0
        contNoite = 0
        tarefas.each do |tarefa|
            mes_corrente = DateTime.current.to_date.month
            if mes_corrente == tarefa.created_at.month
                per = periodo(tarefa.created_at)
                if per == 'Manhã'
                    contManha = contManha + 1
                elsif per == 'Tarde'
                    contTarde = contTarde + 1
                else
                    contNoite = contNoite + 1
                end
            end
        end
        { manha: contManha, tarde: contTarde, noite: contNoite }
    end
end