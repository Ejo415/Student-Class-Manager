class ChangeUserKlassTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :UserKlass, :user_klasses
  end
end
