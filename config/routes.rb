Rails.application.routes.draw do
  # RECTOR LABS - Homepage
  root "pages#home"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA files (optional)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
