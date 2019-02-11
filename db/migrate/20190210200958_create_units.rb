class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.integer: :id
      t.string :slug
      t.string :title
      t.boolean: :completed_all
      t.boolean: :started_any
      t.boolean: :visible

      t.belongs_to :lesson, index: true
    end
  end
end
