Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'static_public#landing_page'
  get 'privacy', to: 'static_public#privacy'
  get 'terms', to: 'static_public#privacy'
  resources :users, only: %i[index show] # users컨트롤러의 index 액션에 대한 라우트만을 생성하도록 지정.

end
