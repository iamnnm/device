# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new', as: 'sign_in'
    get 'sign_up', to: 'devise/registrations#new', as: 'sign_up'
    get 'sign_out', to: 'devise/sessions#destroy', as: 'sign_out'
  end

  root to: 'articles#index'

  resources :users, only: %i[show edit update]

  resources :articles do
    resources :comments, only: %i[create destroy]
    resources :votes, only: %i[create destroy]
  end

  resources :comments, only: %i[] do
    resources :votes, only: %i[create destroy]
  end
end
