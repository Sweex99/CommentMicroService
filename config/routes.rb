Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  apipie
  namespace :api do
    namespace :v1 do
      resources :comments do
        collection do
          get 'user_comments/:user_id', to: 'comments#user_comments', as: 'user_comments'
          get 'nested_comments/:comment_id', to: 'comments#nested_comments', as: 'nested_comments'
          get 'product_comments/:product_id', to: 'comments#product_comments', as: 'product_comments'
        end
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
