class CreateQuestionVotes < ActiveRecord::Migration
  def change
    create_table :question_votes do |t|
      t.integer :value
      t.references :user, index: true
      t.references :question, index: true

      t.timestamps
    end
  end
end
