class CreateAnswerVotes < ActiveRecord::Migration
  def change
    create_table :answer_votes do |t|
      t.integer :value
      t.references :user, index: true
      t.references :answer, index: true

      t.timestamps
    end
  end
end
