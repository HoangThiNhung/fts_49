Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: "registrations",
    sessions: "sessions"}
  root "static_page#home"
  get "static_page/about"
  resources :exams
  resources :questions
  resources :users

  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"

  namespace :admin do
    root "questions#index"
    resources :questions
    resources :subjects
    resources :users, only: [:index, :show]
    resources :exams, only: [:index]
    resources :devise_admin_logs, only: [:index]
  end
end
