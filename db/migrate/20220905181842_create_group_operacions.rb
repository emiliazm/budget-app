class CreateGroupOperacions < ActiveRecord::Migration[7.0]
  def change
    create_table :group_operacions do |t|
      t.references :group, null: false, foreign_key: true
      t.references :operation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
