class AddAuthorToComments < ActiveRecord::Migration[7.2]
  def change
    add_reference :comments, :author, polymorphic: true
  end
end
