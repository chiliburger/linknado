class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :link_id,  :null => false
      t.string  :username, :null => false
      t.text    :body,     :null => false
      t.index   :link_id
      t.timestamps
    end
  end
end
