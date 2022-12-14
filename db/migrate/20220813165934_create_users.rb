class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname
      t.string :email

      t.timestamps
    end
    add_index :users, :nickname, unique: true
  end
end
