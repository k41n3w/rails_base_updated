class CreateChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :channels do |t|
      t.string :name
      t.string :description
      t.string :group
      t.string :tag
      t.string :image

      t.timestamps
    end
  end
end
