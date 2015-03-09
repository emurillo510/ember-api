require 'api_constraints'

Rails.application.routes.draw do

  devise_for :users
    # The configuration handles versioning through headers, and for now the version 1 is the default.
    namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
       scope module: :v1 , constraints: ApiConstraints.new(version: 1, default: true) do

         resources :posts, :comments, :brands, :users

       end
    end
end
