Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'flights#index'
  get 'flights' => 'flights#index'
  get 'booking/checkout' => 'booking#checkout'
  get 'booking/choose_your_seat' => 'booking#choose_your_seat'
  get 'booking/confirm' => 'booking#confirm_seat'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
