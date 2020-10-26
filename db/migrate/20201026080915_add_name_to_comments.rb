class AddNameToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :name, :string
  end
end
