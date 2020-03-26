class CreateAnagrams < ActiveRecord::Migration[6.0]
  def change
    create_table :anagrams do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
