Ticket::Application.routes.draw do
  get "pages/home"
  get "sessions/new"

  resources :usuarios, :chamados, :statuses
  resources :sessions, :only => [:new, :create, :destroy]
  resources :comentarios, :only => [:create, :destroy]

  match '/cadastro',         :to => 'usuarios#new'
  match '/cadastro_chamado', :to => 'chamados#new'
  match '/entrar' ,          :to => 'sessions#new'
  match '/sair' ,            :to => 'sessions#destroy'
  
  root :to => 'pages#home'
end