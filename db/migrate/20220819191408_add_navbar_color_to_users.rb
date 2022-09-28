class AddNavbarColorToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :navbar_color, :string, default: '#370617'
  end
end
