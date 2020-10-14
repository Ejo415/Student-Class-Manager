class ChangeKlassIdColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :user_klasses, :klasses_id, :klass_id
  end
end
