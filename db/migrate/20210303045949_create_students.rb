class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.text :name
      t.text :department
      t.text :phone
      t.text :email

      t.timestamps
    end
  end
end
