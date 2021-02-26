class CreateDialogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dialogs do |t|
      t.integer :dialog_first_user_id
      t.integer :dialog_second_user_id

      t.timestamps
    end
  end
end
