Rails.application.routes.draw do

  #1 予めメインのモデル・コントローラー作成する
  # コントローラーで indexアクションを定義（空欄）
  root to: 'tweets#index'#ここがtop pageとなる
  resources :tweets
  #1


  
end
