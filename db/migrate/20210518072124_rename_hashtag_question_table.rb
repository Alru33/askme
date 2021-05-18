class RenameHashtagQuestionTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :hashtags_questions, :hashtag_questions
  end
end
