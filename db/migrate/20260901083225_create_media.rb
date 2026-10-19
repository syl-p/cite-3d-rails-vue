class CreateMedia < ActiveRecord::Migration[8.0]
  def change
    create_table :media do |t|
      t.belongs_to :part
      t.belongs_to :user
      t.text :description
      t.timestamps
    end
  end
end
