Rails.application.routes.draw do
  root 'anagram#index'

  get 'file_upload/new'
  post 'file_upload/create'

  get 'anagram/index'

  match '*path' => redirect('/'), via: :get
end
