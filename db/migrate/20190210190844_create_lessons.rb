class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.boolean :complete
      t.string :started_at 
      t.string :updated_at 
      t.boolean :viewed
      t.string :github_repo_name 
      t.string :content_type 
      t.string :canonical_kind 
      t.integer :id
      t.string :slug 
      t.string :title 
      t.boolean :visible

      t.belongs_to :unit, index: true
    end
  end
end
