class Comment < ApplicationRecord

  #アソシエーション
  belongs_to :tweet
  belongs_to :user

end
