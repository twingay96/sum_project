Rails.application.routes.draw do
  match '/500', via: :all, to: 'errors#internal_server_error'
  match '/404', via: :all, to: 'errors#not_found'
  
  resources :posts
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', confirmations: 'confirmations' }
  root 'static_public#landing_page'
  get 'privacy', to: 'static_public#privacy'
  get 'terms', to: 'static_public#privacy'
  get 'tetris', to: 'static_public#tetris' # tetris 페이지 라우트설정
  delete 'dismiss_flash', to: 'users#dismiss_flash'
  resources :users, only: %i[index show] # users컨트롤러의 index 액션에 대한 라우트만을 생성하도록 지정.

  
end
