# frozen_string_literal: true

class CreatePackages < ActiveRecord::Migration[7.1]
  def change
    create_table :packages do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :sender, null: false, foreign_key: { to_table: :users }
      t.boolean :is_anon, null: false, default: 0
      t.datetime :deliver_at

      t.timestamps
    end
  end
end
