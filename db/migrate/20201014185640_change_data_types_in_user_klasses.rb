class ChangeDataTypesInUserKlasses < ActiveRecord::Migration[6.0]
  def change
    change_column :user_klasses, :user_id, :integer
  end
  def change
    change_column :user_klasses, :klass_id, :integer
  end
end
