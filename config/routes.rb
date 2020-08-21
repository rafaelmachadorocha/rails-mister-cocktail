Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails do
    collection do
      post 'ingredient'
      get 'ingredient'
    end
    resources :doses, only: [:new, :create] do
      get 'from_show', on: :new
    end
  end
  get '/cocktails/:id/edit_from_show', to: 'cocktails#edit_from_show', as: 'edit_from_show'
  resources :doses, only: :destroy
  root to: 'cocktails#index'
end
