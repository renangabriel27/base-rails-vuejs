Rails.application.routes.draw do
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  #========================================
  # Users
  #========================================
  devise_for :users, skip: [:sessions, :registrations]

  as :user do
    root to: 'devise/sessions#new'

    get '/users/login',
        to: 'devise/sessions#new',
        as: 'new_user_session'

    post '/users/login',
         to: 'devise/sessions#create',
         as: 'user_session'

    delete '/users/logout',
           to: 'devise/sessions#destroy',
           as: 'destroy_user_session'

    get '/users/sign_up',
        to: 'devise/registrations#new',
        as: 'new_user_registration'

    post '/users',
         to: 'devise/registrations#create',
         as: 'users'

    put '/users',
        to: 'users/registrations#update',
        as: 'user_registration'

    get '/users/edit',
        to: 'users/registrations#edit',
        as: 'edit_user_registration'
  end

  authenticate :user do
    namespace :users do
      root to: 'home#index'
    end
  end
end
