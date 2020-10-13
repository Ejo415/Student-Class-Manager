class UserKlassTable < ActiveRecord::Migration[6.0]
  def change
    create_table :UserKlass do |t|
      t.references :klasses, foreign_key: true
      t.references :users, foreign_key: true
      t.boolean :reminder
    end
  end
end
