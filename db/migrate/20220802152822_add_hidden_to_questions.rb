class AddHiddenToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :hidden, :boolean, default: false
  end
end
