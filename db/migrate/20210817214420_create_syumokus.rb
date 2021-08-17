class CreateSyumokus < ActiveRecord::Migration[6.1]
  def change
    create_table :syumokus do |t|
      t.string :name
      t.integer :kigen

      t.timestamps
    end
  end
end
