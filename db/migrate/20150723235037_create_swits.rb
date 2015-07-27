class CreateSwits < ActiveRecord::Migration
  def change
    create_table :swits do |t|
      t.references :user, index: true
      t.string :content

      t.timestamps
    end
  end
end
