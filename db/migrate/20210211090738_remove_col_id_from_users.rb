class RemoveColIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :col_id, :string
  end
end
