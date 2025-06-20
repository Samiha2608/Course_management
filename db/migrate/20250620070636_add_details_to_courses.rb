class AddDetailsToCourses < ActiveRecord::Migration[7.2]
  def change
    add_column :courses, :description, :text
    add_column :courses, :price, :decimal
  end
end
