class AddVisibleToAnimal < ActiveRecord::Migration[6.1]
  def change
    add_column :animals, :visible, :boolean, default: true
  end
end
