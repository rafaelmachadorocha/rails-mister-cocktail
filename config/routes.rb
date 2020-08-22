Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails do
    collection do
      post 'ingredient'
      get 'ingredient'
    end
    resources :doses, only: [:new, :create] do
    end
  end
  delete '/doses/:id', to: 'doses#destroy', as: :dose
  get '/cocktails/:cocktail_id/doses', to: 'cocktails#show'
  root to: 'cocktails#index'
end
