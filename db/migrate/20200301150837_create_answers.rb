class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.references :issue, index: true
      t.text :answer
      t.references :user, index: true

      t.timestamps
    end
  end
end
