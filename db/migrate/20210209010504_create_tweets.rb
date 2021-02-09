class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.string :them_col
      t.string :text
      t.text :image_url
      t.timestamps
    end
  end
end
