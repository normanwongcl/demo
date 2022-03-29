# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Namespace for the route to become /api/v1/salaries
  namespace :api do
    namespace :v1 do
      # Rails has a method that generate all CRUD routes for salaries using resources method
      # - List collection
      # - Show details of single resource
      # - Create new resource
      # - Update existing resource
      # - Delete existing resource
      resources :salaries, only: %i[index create]
    end
  end
end
