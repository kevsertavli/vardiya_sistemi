Rails.application.routes.draw do
  resources :users
  resources :departments
  resources :shifts
  resources :assignments
  resources :leave_records
end
