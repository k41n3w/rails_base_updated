class CreatePrograms < ActiveRecord::Migration[6.1]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :group
      t.string :start_at
      t.string :ends_at
      t.references :channel, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
