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

  
  validates :name, :kana, :birth, :gender, :nick_name, :them_col, presence: true
  

  #active hash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  #belongs_to_active_hash :them_col
  #↑現状は on にするとエラーになる
  #原因不明（DBの型？あるいはからむ名に_idがついて無いの違いがある


end
