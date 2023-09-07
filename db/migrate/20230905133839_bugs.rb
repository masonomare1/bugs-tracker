# frozen_string_literal: true

# this user policy
class Bugs < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs do |t|
      t.text :title
      t.datetime :deadline
      t.datetime :time
      t.string :type
      t.string :status
      t.integer :creator_id
      t.integer :dev_id
      t.integer :project_id

      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :bugs, :users, column: :creator_id, primary_key: :id
    add_foreign_key :bugs, :users, column: :dev_id, primary_key: :id
    add_foreign_key :bugs, :projects, column: :project_id, primary_key: :id
  end
end
