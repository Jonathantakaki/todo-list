class TarefasController < ApplicationController
  before_action :set_grupo
  before_action :set_grupo_tarefa, only: [:show, :update, :destroy]
  skip_before_action :set_grupo, only: [:ultimas_tarefas]


  # GET /grupos/:grupo_id/tarefas
  def index
    @tarefas = @grupo.tarefas
  end

  # GET /grupos/:grupo_id/tarefas/:id
  def show
    json_response(@tarefa)
  end

  # POST /grupos/:grupo_id/tarefas
  def create
    @grupo.tarefas.create!(tarefa_params)
    json_response(@grupo, :created)
  end

  # PUT /grupos/:grupo_id/tarefas/:id
  def update
    @tarefa.update(tarefa_params)
    head :no_content
  end

  # DELETE /grupos/:grupo_id/tarefas/:id
  def destroy
    @tarefa.removido = DateTime.current.to_date
    @tarefa.save!
    head :no_content
  end

  def ultimas_tarefas
    @tarefas = Tarefa.all.order(id: :desc).limit(10)
    json_response(@tarefas)
  end

  private

  def tarefa_params
    params.permit(:nome, :concluido)
  end

  def set_grupo
    @grupo = Grupo.find(params[:grupo_id])
  end

  def set_grupo_tarefa
    @tarefa = @grupo.tarefas.find_by!(id: params[:id]) if @grupo
  end
end