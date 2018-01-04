class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :title
      t.text :description
      t.boolean :completed
      t.date :due_date

      t.timestamps null: false
    end
  end
end
