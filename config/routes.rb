Rails.application.routes.draw do
  namespace "api" do
    namespace "v1" do
      resources :sales
    end
  end

  root to: "sessions#welcome"

  get "request_api", to: "sales_reports#request_api"

  get "report", to: "sales_reports#report"
  post "sales_report", to: "sales_reports#sales_report"

  get "upload", to: "sales_reports#upload"
  post "import", to: "sales_reports#import"
end
