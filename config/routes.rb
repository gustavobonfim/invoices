Rails.application.routes.draw do


  get '/new_invoices_sum', to: 'charts#new_invoices_sum'
  get '/new_invoices_count', to: 'charts#new_invoices_count'
  get '/new_invoices_company', to: 'charts#new_invoices_company'
  get '/new_invoices_sum_count', to: 'charts#new_invoices_sum_count'


  root 'invoices#index'

  get '/test', to: 'pages#test'

  resources :invoices do
    collection do
      match 'search' => 'invoices#search', via: [:get, :post], as: :search
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
