Rails.application.routes.draw do
  root to: "notes#index"
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :notes do
    member do
      put :note_permissions
    end
  end
end
