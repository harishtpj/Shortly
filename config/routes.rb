Rails.application.routes.draw do
  root "urls#home"
  get "/about", to: "urls#about"
  post "/", to: "urls#create", as: :urls
  get "/:url_id", to: "urls#show", as: :url

  get "up" => "rails/health#show", as: :rails_health_check
end
