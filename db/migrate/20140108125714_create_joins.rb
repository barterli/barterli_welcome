class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.string :email
      t.string :association_type
      t.text :message

      t.timestamps
    end
  end
end
