Rails.application.routes.draw do
  resources :rssradios do
    member do
      get "scriptradio"
    end
  end
  resources :jsonradios do
    member do
      get "nommusiques1"
      get "downloadmusic2"
    end
  end
  resources :synthes
  get 'hack/radio'
  get 'hack/radiopeyi1'
  get 'hack/radiopeyi2'
  get 'hack/nrjguyane1'
  get 'hack/nrjguyane2'
  get 'hack/bblack1'
  get 'hack/bblack2'
  get 'hack/cherie1'
  get 'hack/cherie2'
  get 'hack/metis1'
  get 'hack/metis2'
  get 'home/index'
  resources :songs do
    collection do
      get "allsong"
    end
    member do
      get "synthe"
      get "idontlike"
      get "addlyrics"
      get "editlyrics"
    end
  end
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :welcome
end
