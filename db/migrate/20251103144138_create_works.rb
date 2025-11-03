class CreateWorks < ActiveRecord::Migration[8.1]
  def change
    create_table :works do |t|
      t.string :title
      t.string :slug
      t.string :github_url
      t.string :live_url
      t.string :repo_name
      t.text :story
      t.text :summary
      t.string :category
      t.string :status
      t.date :started_at
      t.date :launched_at
      t.boolean :featured
      t.integer :github_stars
      t.integer :github_forks

      t.timestamps
    end
  end
end
