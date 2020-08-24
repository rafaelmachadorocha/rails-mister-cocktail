Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses, only: [:new, :create] do
    end
  end
  delete '/doses/:id', to: 'doses#destroy', as: :dose
  get '/search', to: 'cocktails#search'
  root to: 'cocktails#index'
end
