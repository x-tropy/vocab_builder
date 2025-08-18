class CreateWords < ActiveRecord::Migration[8.0]
  def change
    create_table :words do |t|
      t.string :headword
      t.integer :s_band
      t.integer :w_band

      t.timestamps
    end
  end
end
