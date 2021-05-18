class AddTimeStampToHashtagQuestion < ActiveRecord::Migration[6.1]
  def change
    change_table :hashtags_questions do |t|
      t.timestamps
    end
  end
end
