class AddUniqueIndexToWordsHeadword < ActiveRecord::Migration[8.0]
  def change
    add_index :words, :headword, unique: true
  end
end
