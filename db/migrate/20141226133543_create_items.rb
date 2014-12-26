class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :text
      t.integer :user_id
      t.integer :note_id

      t.timestamps
    end
  end
end
