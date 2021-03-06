Rails.application.routes.draw do

  resources :employees
  resources :companies do 
    collection { post :import }
  end

  devise_for :users
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/contact'
  get 'welcome/faq'
  get 'welcome/pricing'
  get 'welcome/features'

  resources :invoices do
    resources :purchases, except: [:index, :show], controller: 'invoices/purchases'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'
end
