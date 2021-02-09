class Tweet < ApplicationRecord

  #2 active storage用
  has_one_attached :image
  #↑を記述したらコントローラーで保存の許可をする


  #1
  validates :text, presence: true, unless: :was_attached?
  #2 ↑unless: :was_attached?は画像のみでも投稿できるように
  def was_attached?
    self.image.attached?
  end

  
end
