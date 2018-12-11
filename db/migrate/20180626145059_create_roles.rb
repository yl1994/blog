class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name,comment: "角色名称"
      t.text :desc, comment: "角色描述"

      t.timestamps
    end
  end
end
