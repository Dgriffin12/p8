class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :review, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
