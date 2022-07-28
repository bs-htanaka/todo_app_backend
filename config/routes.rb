Rails.application.routes.draw do
  resources :todos
  get "search" => "searches#search"
end
