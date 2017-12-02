Rails.application.routes.draw do

  root "trips#index"
  resources :trips do
    resources :locations
  end

  scope "locations/:location_id", as: "location" do
    resources :addresses
  end

end