class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :in_url
      t.text :out_url
      t.integer :http_status
      t.integer :user_id

      t.timestamps
    end
  end
end
