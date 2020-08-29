Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  resources :articles
  resources :categories
  resources :sub_categories

  root 'categories#index'
end
