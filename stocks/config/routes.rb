Rails.application.routes.draw do
  resources :stocks, except: :show
  get '/stocks/:symbol', to: 'stocks#show', constraints: { symbol: /[a-zA-Z\.]+/}
  get '/trades/:symbol', to: 'trades#index', constraints: { symbol: /[a-zA-Z\.]+/}
end
