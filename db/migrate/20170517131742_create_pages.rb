class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.text :description
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
