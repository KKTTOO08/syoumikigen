class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.references :type, null: false, foreign_key: true

      t.timestamps
      
    end
  end
end
