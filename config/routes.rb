Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'ycontent#index'
  get 'get_content', to: 'ycontent#get_post'
end
