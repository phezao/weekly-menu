class CreateExamples < ActiveRecord::Migration[6.0]
  def change
    create_table :examples do |t|
      t.string :str
      t.integer :int
      t.string :txt

      t.timestamps
    end
  end
end
