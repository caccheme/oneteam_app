OneteamApp::Application.routes.draw do
  resources :feedbacks


    resources :commissions

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "employees#new", :as => "sign_up"
  root :to => "sessions#new" 
  
  resources :requests do 
    resources :responses 
  end

  resources :responses do
      resources :commissions
  end

  resources :employees
  resources :sessions
  resources :requests
  resources :responses
  
end