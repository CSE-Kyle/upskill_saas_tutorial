Rails.application.routes.draw do
    root to: 'pages#home'
    get 'about', to: 'pages#about' # routing to the "about" page
    resources :contacts
    get 'contact-us', to: 'contacts#new'
end
