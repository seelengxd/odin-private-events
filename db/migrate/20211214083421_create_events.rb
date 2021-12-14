class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :creator_id
      t.date :date
      t.string :location

      t.timestamps
    end
  end
end
