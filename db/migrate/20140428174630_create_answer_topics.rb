class CreateAnswerTopics < ActiveRecord::Migration
  def change
    create_table :answer_topics do |t|
      t.references :answer, index: true
      t.references :topic, index: true
      t.timestamps
    end
  end
end
