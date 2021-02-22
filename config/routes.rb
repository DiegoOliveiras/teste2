Rails.application.routes.draw do
  namespace 'api' do
  	namespace 'v1' do
  		resources :sales_reports_items
  	end
  end
  
  root to: 'sessions#welcome'  
  
  get 'request_api', to: 'sales_reports_items#request_api'    

  #get 'report', to: 'sales_reports_items#report'
  #get 'upload', to: 'sales_reports_items#upload'
  #post 'import', to: 'sales_reports_items#import'
  #post 'sales_report', to: 'sales_reports_items#sales_report'
end
