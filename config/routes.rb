Rails.application.routes.draw do
  resources :orders do
    resources :line_items, controller: 'order/line_items'
  end
end
