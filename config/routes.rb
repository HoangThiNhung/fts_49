Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: "registrations"}
  root "static_page#home"
  get "static_page/about"
end
