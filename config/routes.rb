Ticket::Application.routes.draw do

  resources :usuarios, :chamados, :statuses
  
  get "pages/home"
  
  root :to => 'pages#home'
  
  match '/cadastro', :to => "usuarios#new"
  match '/cadastro_chamado', :to => "chamados#new"
  
end