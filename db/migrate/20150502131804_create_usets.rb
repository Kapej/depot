class CreateUsets < ActiveRecord::Migration
  def change
    create_table :usets do |t|
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
