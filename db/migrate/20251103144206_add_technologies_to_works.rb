class AddTechnologiesToWorks < ActiveRecord::Migration[8.1]
  def change
    add_column :works, :technologies, :json
  end
end
