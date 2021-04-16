class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.text :name
      t.text :department
      t.text :grade
      t.text :phone
      t.text :email

      t.timestamps
    end
  end
end
