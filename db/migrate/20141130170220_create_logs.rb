class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :plane_id
      t.text :text
      t.integer :status
      t.integer :user_id

      t.timestamps
    end
  end
end
