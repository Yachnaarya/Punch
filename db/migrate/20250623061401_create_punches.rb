class CreatePunches < ActiveRecord::Migration[8.0]
  def change
    create_table :punches do |t|
      t.datetime :in_time
      t.datetime :out_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
