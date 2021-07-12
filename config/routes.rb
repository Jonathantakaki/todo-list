Rails.application.routes.draw do
  resources :grupos do
    resources :tarefas
  end

  controller :tarefas do
    get 'ultimas_tarefas', action: :ultimas_tarefas
  end
end
