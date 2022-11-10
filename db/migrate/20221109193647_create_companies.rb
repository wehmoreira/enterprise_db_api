class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :cnpj
      t.integer :total_employees
      t.integer :total_systems

      t.timestamps
    end
  end
end
