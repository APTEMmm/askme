class CreateHashtagQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :hashtag_questions do |t|
      t.belongs_to :hashtag, foreign_key: true, null: false
      t.belongs_to :question, foreign_key: true, null: false
      t.index %i[hashtag_id question_id], unique: true

      t.timestamps
    end
  end
end
