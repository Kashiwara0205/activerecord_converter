class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.date :birthday
      t.boolean :has_pet
      t.boolean :married

      t.timestamps
    end

    execute <<-SQL
      ALTER TABLE `members` ADD sex ENUM('male', 'female') NOT NULL;
    SQL
  end
end
