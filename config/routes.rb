Rails.application.routes.draw do

  root 'invoices#index'

  get '/test', to: 'pages#test'

  resources :invoices do
    collection do
      match 'search' => 'invoices#search', via: [:get, :post], as: :search
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
