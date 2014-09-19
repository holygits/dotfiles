Rails.application.routes.draw do

  resources :freedom_items

  resources :goals

  resources :wins

  resources :expenses

  resources :portfolios

  root 'portfolios#show'

end