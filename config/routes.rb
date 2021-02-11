Rails.application.routes.draw do

  #devise初期設定
  devise_for :users

  #1 予めメインのモデル・コントローラー作成する
  # コントローラーで indexアクションを定義（空欄）
  root to: 'tweets#index'#ここがtop pageとなる
  resources :tweets
  


  
end
