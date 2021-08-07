class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.references :countory, foreign_key: true, comment: "原産国"
      t.references :animal_type, foreign_key: true
      t.string :name
      t.integer :weight
      t.integer :height

      t.timestamps
    end

    execute <<-SQL
      ALTER TABLE `animals` ADD body ENUM('small', 'middle', 'large') NOT NULL;
    SQL

    execute <<-SQL
      ALTER TABLE `animals` ADD hair ENUM('none', 'short', 'long') NOT NULL;
    SQL
  end
end
