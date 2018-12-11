class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.integer :user_id, comment: "用户id"
      t.integer :role_id, comment: "角色id"

      t.timestamps
    end
  end
end
