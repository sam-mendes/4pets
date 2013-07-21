class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 150, null: false
      t.string :email, limit: 150, null: false
      t.string :password_digest, null: false
      t.references :role, index: true, null: false, default: 1
      t.timestamps
    end

   	add_index :users, :email, unique: true
  end
end
