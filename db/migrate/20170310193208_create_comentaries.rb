class CreateComentaries < ActiveRecord::Migration[5.0]
  def change
    create_table :comentaries do |t|
      t.string :user
      t.text :body
      t.references :article

      t.timestamps
    end
  end
end
