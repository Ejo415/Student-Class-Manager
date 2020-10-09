class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.innteger :class_id
      t.boolean :reminder

      t.timestamps
    end
  end
end
