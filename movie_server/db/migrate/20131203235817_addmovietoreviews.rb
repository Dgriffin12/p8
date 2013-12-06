class Addmovietoreviews < ActiveRecord::Migration
  def change
	add_column :reviews, :movie, :string
  end
end
