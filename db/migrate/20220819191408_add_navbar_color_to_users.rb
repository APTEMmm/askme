class AddNavbarColorToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :navbar_color, :string
  end
end
