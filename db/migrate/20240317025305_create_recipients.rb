# frozen_string_literal: true

class CreateRecipients < ActiveRecord::Migration[7.1]
  def change
    create_table :recipients do |t|
      t.string :email
      t.references :user, foreign_key: true
      t.references :package, null: false, foreign_key: true
      t.datetime :delivered_at
      t.datetime :opened_at

      t.timestamps
    end
  end
end
