class AddUserToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :user_id, :integer
    add_index :question, :user_id
  end
end
