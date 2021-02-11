class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #↓必要に応じて機能を追加
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable, :trackable
  #最初は認証無しで実装

  #アソシエーション
  has_many :tweets
  has_many :comments

  
  validates :name, :kana, :birth, :gender, :nick_name, :color, presence: true
  

  #active hash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  belongs_to_active_hash :color
  #DBの型がstringあるいはからむ名に_idがついて無いなどでエラーになったことある


end
