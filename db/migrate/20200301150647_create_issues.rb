class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.string :title
      t.text :issue
      t.boolean :open, default: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
