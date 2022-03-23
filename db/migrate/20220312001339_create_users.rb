class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :name
      t.integer :sex
      t.integer :age
      t.string :profile_image
      t.boolean :is_admin, null: false, default: false
      t.timestamps
    end
  end
end
