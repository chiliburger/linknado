class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string  :name,     :null    => false
      t.text    :uri,      :null    => false
      t.string  :username, :null    => false
      t.integer :points,   :default => 0

      t.timestamps
    end
  end
end
