class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :swit_id
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
    add_index :comments, :swit_id
  end
end
