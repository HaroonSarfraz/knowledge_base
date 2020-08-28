Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :articles
  resources :sub_categories
  get 'sub_category/index'
  get 'sub_category/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
