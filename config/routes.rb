Rails.application.routes.draw do

  #devise初期設定
  devise_for :users

  #1 予めメインのモデル・コントローラー作成する
  # コントローラーで indexアクションを定義（空欄）
  root to: 'tweets#index'#ここがtop pageとなる
  
  #2 基本の７つのアクションのみ
  # resources :tweets
  
  #3 検索の機能を追加
  resources :tweets do
    collection do
      get 'kensaku'
    end
  end
  

  
end
