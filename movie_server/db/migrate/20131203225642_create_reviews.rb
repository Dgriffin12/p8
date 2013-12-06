class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.string :movie
      t.references :user, index: true

      t.timestamps
    end
  end
end
