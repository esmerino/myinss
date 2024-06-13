# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "sessions#new"
  resources :bidders, except: %i[show]
  resources :sessions, only: %i[new create destroy]
  resources :calculators, only: :index
  resources :reports, only: :index

  get "up" => "rails/health#show", as: :rails_health_check
end
