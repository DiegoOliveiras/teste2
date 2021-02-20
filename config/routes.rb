Rails.application.routes.draw do
  #get 'login', to: 'sessions#new'
  #post 'login', to: 'sessions#create'
  #get 'authorized', to: 'sessions#page_requires_login'
  
  root to: 'sessions#welcome'  
  
  get 'welcome', to: 'sessions#welcome'    

  get 'report', to: 'sales_reports_items#report'
  get 'upload', to: 'sales_reports_items#upload'
  post 'import', to: 'sales_reports_items#import'
  post 'sales_report', to: 'sales_reports_items#sales_report'

  resources :sales_reports_items, only: [:index, :show, :create, :update, :destroy]
end
