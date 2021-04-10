class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references  :board, null: false
      t.string      :name,  null: false, default: ""
      t.text        :description,  null: false, default: ""
      t.timestamps
    end
  end
end
