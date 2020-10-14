class ChangeUserIdDataTypeInUserKlasses < ActiveRecord::Migration[6.0]
  def change
    change_column :user_klasses, :user_id, :integer
  end
end
