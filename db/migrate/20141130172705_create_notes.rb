class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :plane_id
      t.text :text
      t.integer :state
      t.integer :user_id

      t.timestamps
    end
  end
end
