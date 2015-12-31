Rails.application.routes.draw do
  devise_for :users
  root "static_page#home"
  get "static_page/about"
end
