Rails.application.routes.draw do

    namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
       scope module: :v1 do

         resources :posts, :comments, :brands, :users

       end
    end
end
