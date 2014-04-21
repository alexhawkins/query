class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.boolean :answered,  default: false
      t.references :topic, index: true

      t.timestamps
    end
  end
end
