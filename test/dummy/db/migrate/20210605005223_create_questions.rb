class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.references :member, foreign_key: true
      t.string :title
      t.string :content

      t.timestamps
    end

    execute <<-SQL
      ALTER TABLE `questions` ADD phase ENUM('new', 'doing', 'done') NOT NULL;
    SQL
  end
end
