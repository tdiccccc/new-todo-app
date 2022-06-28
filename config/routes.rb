Rails.application.routes.draw do
  root to: redirect('/todos') ##todosにリダイレクト
  
  get 'todos', to: 'site#index'
  get 'todos/new', to: 'site#index'
  get 'todos/:id/edit', to: 'site#index'
  
  namespace :api do
    ##Reactでhttp通信を行うためのルーティング
    namespace :v1 do
      delete '/todos/destroy_all', to: 'todos#destroy_all'
      resources :todos, only: %i[index show create update destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
