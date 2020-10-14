class ChangeUserIdColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :user_klasses, :users_id, :user_id
  end
end
