Rails.application.routes.draw do
  root 'anagram#index'

  get 'file_upload/new'
  post 'file_upload/create'

  get 'anagram/index'
  get 'anagram/create'
  post 'anagram/create'

  match '*path' => redirect('/'), via: :get
end
