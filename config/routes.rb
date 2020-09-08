Rails.application.routes.draw do
  namespace :order do
    resources :line_items
  end
  resources :orders
end
